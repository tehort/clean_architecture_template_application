part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {}

class SignInUsernameChangedEvent extends SignInEvent {
  SignInUsernameChangedEvent({
    required this.username,
  });

  final String username;

  @override
  List<Object?> get props => [username];
}

class SignInPasswordChangedEvent extends SignInEvent {
  SignInPasswordChangedEvent({
    required this.password,
  });

  final String password;

  @override
  List<Object?> get props => [password];
}

class SignInRememberMeChangedEvent extends SignInEvent {
  SignInRememberMeChangedEvent({
    required this.rememberMe,
  });

  final bool rememberMe;

  @override
  List<Object?> get props => [rememberMe];
}

class SignInSignInButtonPressedEvent extends SignInEvent {
  SignInSignInButtonPressedEvent();

  @override
  List<Object?> get props => [];
}

class SignInSignUpButtonPressedEvent extends SignInEvent {
  SignInSignUpButtonPressedEvent();

  @override
  List<Object?> get props => [];
}
