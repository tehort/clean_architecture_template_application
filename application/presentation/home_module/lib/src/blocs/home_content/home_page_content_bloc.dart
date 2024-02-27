import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:user_domain/user_domain.dart';

part 'home_page_content_event.dart';
part 'home_page_content_state.dart';

class HomePageContentBloc extends Bloc<HomePageContentEvent, HomePageContentState> {
  HomePageContentBloc({required GetLoggedUserUseCase getLoggedUserUseCase})
      : _getLoggedUserUseCase = getLoggedUserUseCase,
        super(HomePageContentLoadingState()) {
    on<LoggedUserRequestEvent>(_onLoggedUserRequestEvent);
  }

  final GetLoggedUserUseCase _getLoggedUserUseCase;

  FutureOr<void> _onLoggedUserRequestEvent(
    LoggedUserRequestEvent event,
    Emitter<HomePageContentState> emit,
  ) async {
    emit(HomePageContentLoadingState());
    final result = await _getLoggedUserUseCase.call();
    switch (result) {
      case Success<User, Exception>(value: final user):
        emit(HomePageContentLoadedState(user: user));
      case Failure<User, Exception>(exception: final exception):
        emit(HomePageContentErrorState(errorMessage: exception.toString()));
    }
  }
}
