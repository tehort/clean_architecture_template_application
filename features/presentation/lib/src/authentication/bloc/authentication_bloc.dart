import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const Unauthenticated()) {
    on<AppStarted>(_onAppStartedEvent);
    on<LoggedIn>(_onLoggedInEvent);
    on<LoggedOut>(_onLoggedOutEvent);
  }

  _onAppStartedEvent(AppStarted event, Emitter<AuthenticationState> emit) {
    emit(const Unauthenticated());
  }

  _onLoggedInEvent(LoggedIn event, Emitter<AuthenticationState> emit) {
    emit(
      Authenticated(
        authenticationToken: event.authenticationToken,
        refreshToken: event.refreshToken,
      ),
    );
  }

  _onLoggedOutEvent(LoggedOut event, Emitter<AuthenticationState> emit) {
    emit(const Unauthenticated());
  }
}
