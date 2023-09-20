import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

// ignore: lines_longer_than_80_chars
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const Unauthenticated()) {
    on<AppStarted>(_onAppStartedEvent);
    on<LoggedIn>(_onLoggedInEvent);
    on<LoggedOut>(_onLoggedOutEvent);
  }

  void _onAppStartedEvent(AppStarted event, Emitter<AuthenticationState> emit) {
    emit(const Unauthenticated());
  }

  void _onLoggedInEvent(LoggedIn event, Emitter<AuthenticationState> emit) {
    emit(
      const Authenticated(
          // authenticatedInfo: event.authenticatedInfo,
          // authenticationToken: event.authenticatToken,
          // refreshToken: event.refreshToken,
          ),
    );
  }

  void _onLoggedOutEvent(LoggedOut event, Emitter<AuthenticationState> emit) {
    emit(const Unauthenticated());
  }
}
