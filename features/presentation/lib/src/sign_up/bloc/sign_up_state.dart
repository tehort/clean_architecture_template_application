part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.acceptTerms,
  });

  const SignUpState.initial()
      : title = '',
        firstName = '',
        lastName = '',
        email = '',
        password = '',
        confirmPassword = '',
        acceptTerms = false;

  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final bool acceptTerms;

  SignUpState copyWith({
    String? title,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    bool? acceptTerms,
  }) {
    return SignUpState(
      title: title ?? this.title,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      acceptTerms: acceptTerms ?? this.acceptTerms,
    );
  }

  @override
  List<Object> get props => [
        title,
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
        acceptTerms,
      ];
}

class SignUpLoadingState extends SignUpState {
  const SignUpLoadingState({
    required super.title,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
    required super.confirmPassword,
    required super.acceptTerms,
  });
}

class SignUpErrorState extends SignUpState {
  const SignUpErrorState({
    required super.title,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
    required super.confirmPassword,
    required this.errorMessage,
    required super.acceptTerms,
  });

  final String errorMessage;

  @override
  List<Object> get props => [
        ...super.props,
        errorMessage,
      ];
}

class SignUpShowSnackbarState extends SignUpState {
  const SignUpShowSnackbarState({
    required super.title,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
    required super.confirmPassword,
    required super.acceptTerms,
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [
        ...super.props,
        message,
      ];
}
