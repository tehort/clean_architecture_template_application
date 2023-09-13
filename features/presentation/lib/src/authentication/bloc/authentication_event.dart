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
  const LoggedIn({
    // required this.userId,
    // required this.authenticationToken,
    // required this.refreshToken,
    required this.authenticatedInfo,
  });

  final AuthenticatedInfo authenticatedInfo;
  // final String userId;
  // final String authenticationToken;
  // final String refreshToken;

  @override
  List<Object> get props => [
        authenticatedInfo,
        // userId,
        // authenticationToken,
        // refreshToken,
      ];
}

final class LoggedOut extends AuthenticationEvent {
  const LoggedOut();

  @override
  List<Object> get props => [];
}
