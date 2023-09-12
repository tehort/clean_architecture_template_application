part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final bool rememberMe;
  final String username;
  final String password;

  const SignInState({
    required this.rememberMe,
    required this.username,
    required this.password,
  });

  const SignInState.initial()
      : username = '',
        password = '',
        rememberMe = false;

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
    required bool rememberMe,
    required String username,
    required String password,
  }) : super(
          rememberMe: rememberMe,
          username: username,
          password: password,
        );

  @override
  List<Object> get props => [
        rememberMe,
        username,
        password,
      ];
}

final class SignInErrorState extends SignInState {
  final String errorMessage;

  const SignInErrorState({
    required rememberMe,
    required username,
    required password,
    required this.errorMessage,
  }) : super(
          rememberMe: rememberMe,
          username: username,
          password: password,
        );

  @override
  List<Object> get props => [
        rememberMe,
        username,
        password,
        errorMessage,
      ];
}
