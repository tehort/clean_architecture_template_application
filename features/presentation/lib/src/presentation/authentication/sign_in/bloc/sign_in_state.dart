part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.rememberMe,
    required this.username,
    required this.password,
  });

  const SignInState.initial()
      : username = '',
        password = '',
        rememberMe = false;

  final bool rememberMe;
  final String username;
  final String password;

  SignInState copyWith({
    bool? rememberMe,
    String? username,
    String? password,
  }) {
    return SignInState(
      rememberMe: rememberMe ?? this.rememberMe,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        rememberMe,
        username,
        password,
      ];
}

final class SignInLoadingState extends SignInState {
  const SignInLoadingState({
    required super.rememberMe,
    required super.username,
    required super.password,
  });

  @override
  List<Object> get props => [
        rememberMe,
        username,
        password,
      ];
}

final class SignInErrorState extends SignInState {
  const SignInErrorState({
    required super.rememberMe,
    required super.username,
    required super.password,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [
        rememberMe,
        username,
        password,
        errorMessage,
      ];
}
