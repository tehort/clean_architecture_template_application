import 'package:authentication_domain/authentication_domain.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required SignInFromStorageUseCase signInFromStorageUsecase,
    required SignOutUseCase signOutUsecase,
  })  : _signInFromStorageUsecase = signInFromStorageUsecase,
        _signOutUsecase = signOutUsecase,
        super(const Loading()) {
    on<AppStarted>(_onAppStartedEvent);
    on<LoggedIn>(_onLoggedInEvent);
    on<LoggedOut>(_onLoggedOutEvent);
  }

  final SignInFromStorageUseCase _signInFromStorageUsecase;
  final SignOutUseCase _signOutUsecase;

  Future<void> _onAppStartedEvent(AppStarted event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final result = await _signInFromStorageUsecase.call();
    switch (result) {
      case Success<AuthenticationInfo, Exception>(value: final authenticationInfo):
        emit(Authenticated(authenticationInfo: authenticationInfo));
      case Failure<AuthenticationInfo, Exception>(exception: _):
        emit(const Unauthenticated());
    }
  }

  void _onLoggedInEvent(LoggedIn event, Emitter<AuthenticationState> emit) {
    emit(Authenticated(authenticationInfo: event.authenticationInfo));
  }

  Future<void> _onLoggedOutEvent(LoggedOut event, Emitter<AuthenticationState> emit) async {
    final result = await _signOutUsecase.call();
    switch (result) {
      default:
        emit(const Unauthenticated());
    }
  }
}
