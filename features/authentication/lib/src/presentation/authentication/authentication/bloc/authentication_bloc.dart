import 'package:authentication/src/usecases/sign_in_with_token_use_case.dart';
import 'package:authentication/src/usecases/sign_out_use_case.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required SignInWithTokenUsecase signInWithTokenUsecase,
    required SignOutUsecase signOutUsecase,
  })  : _signInWithTokenUsecase = signInWithTokenUsecase,
        _signOutUsecase = signOutUsecase,
        super(const Loading()) {
    on<AppStarted>(_onAppStartedEvent);
    on<LoggedIn>(_onLoggedInEvent);
    on<LoggedOut>(_onLoggedOutEvent);
  }

  final SignInWithTokenUsecase _signInWithTokenUsecase;
  final SignOutUsecase _signOutUsecase;

  Future<void> _onAppStartedEvent(AppStarted event, Emitter<AuthenticationState> emit) async {
    emit(const Loading());
    final result = await _signInWithTokenUsecase.call();
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
