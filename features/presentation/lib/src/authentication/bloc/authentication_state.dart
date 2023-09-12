part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class Authenticated extends AuthenticationState {
  final String authenticationToken;
  final String refreshToken;

  const Authenticated({
    required this.authenticationToken,
    required this.refreshToken,
  });

  @override
  List<Object> get props => [
        authenticationToken,
        refreshToken,
      ];
}

final class Unauthenticated extends AuthenticationState {
  const Unauthenticated();

  @override
  List<Object> get props => [];
}
