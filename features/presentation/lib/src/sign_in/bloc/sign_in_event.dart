part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {}

class UsernameChanged extends SignInEvent {
  final String username;

  UsernameChanged({
    required this.username,
  });

  @override
  List<Object?> get props => [username];
}

class PasswordChanged extends SignInEvent {
  final String password;

  PasswordChanged({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}

class RememberMeChanged extends SignInEvent {
  final bool rememberMe;

  RememberMeChanged({
    required this.rememberMe,
  });

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
