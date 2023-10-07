part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class Authenticated extends AuthenticationState {
  const Authenticated({
    required this.authenticationInfo,
  });

  final AuthenticationInfo authenticationInfo;

  @override
  List<Object> get props => [
        authenticationInfo,
      ];
}

final class Unauthenticated extends AuthenticationState {
  const Unauthenticated();

  @override
  List<Object> get props => [];
}
