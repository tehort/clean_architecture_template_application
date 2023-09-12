part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class AppStarted extends AuthenticationEvent {
  const AppStarted();

  @override
  List<Object> get props => [];
}

final class LoggedIn extends AuthenticationEvent {
  final String userId;
  final String authenticationToken;
  final String refreshToken;

  const LoggedIn({
    required this.userId,
    required this.authenticationToken,
    required this.refreshToken,
  });

  @override
  List<Object> get props => [
        userId,
        authenticationToken,
        refreshToken,
      ];
}

final class LoggedOut extends AuthenticationEvent {
  const LoggedOut();

  @override
  List<Object> get props => [];
}
