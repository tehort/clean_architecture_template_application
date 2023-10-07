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
    required this.authenticationInfo,
  }) : super();

  final AuthenticationInfo authenticationInfo;

  @override
  List<Object> get props => [
        authenticationInfo,
      ];
}

final class LoggedOut extends AuthenticationEvent {
  const LoggedOut();

  @override
  List<Object> get props => [];
}
