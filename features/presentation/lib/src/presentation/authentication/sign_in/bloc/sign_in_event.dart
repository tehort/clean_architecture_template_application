part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {}

class UsernameChanged extends SignInEvent {
  UsernameChanged({
    required this.username,
  });

  final String username;

  @override
  List<Object?> get props => [username];
}

class PasswordChanged extends SignInEvent {
  PasswordChanged({
    required this.password,
  });

  final String password;

  @override
  List<Object?> get props => [password];
}

class RememberMeChanged extends SignInEvent {
  RememberMeChanged({
    required this.rememberMe,
  });

  final bool rememberMe;

  @override
  List<Object?> get props => [rememberMe];
}

class SignInButtonPressed extends SignInEvent {
  SignInButtonPressed();

  @override
  List<Object?> get props => [];
}

class SignUpButtonPressed extends SignInEvent {
  SignUpButtonPressed();

  @override
  List<Object?> get props => [];
}
