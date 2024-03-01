import 'package:authentication_domain/authentication_domain.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required RefreshTokenUseCase refreshTokenUseCase,
    required SignOutUseCase signOutUsecase,
  })  : _refreshTokenUseCase = refreshTokenUseCase,
        _signOutUsecase = signOutUsecase,
        super(const Loading()) {
    on<AppStarted>(_onAppStartedEvent);
    on<LoggedIn>(_onLoggedInEvent);
    on<LoggedOut>(_onLoggedOutEvent);
  }

  final RefreshTokenUseCase _refreshTokenUseCase;
  final SignOutUseCase _signOutUsecase;

  Future<void> _onAppStartedEvent(AppStarted event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final result = await _refreshTokenUseCase.call();
    switch (result) {
      case Success<void, Exception>(value: _):
        emit(const Authenticated());
      case Failure<void, Exception>(exception: _):
        emit(const Unauthenticated());
    }
  }

  void _onLoggedInEvent(LoggedIn event, Emitter<AuthenticationState> emit) {
    emit(const Authenticated());
  }

  Future<void> _onLoggedOutEvent(LoggedOut event, Emitter<AuthenticationState> emit) async {
    await _signOutUsecase.call();
    emit(const Unauthenticated());
  }
}
