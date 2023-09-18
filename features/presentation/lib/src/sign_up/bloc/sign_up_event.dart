part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {}

class SignUpUsernameChangedEvent extends SignUpEvent {
  SignUpUsernameChangedEvent({
    required this.username,
  });

  final String username;

  @override
  List<Object?> get props => [username];
}

class SignUpTitleChangedEvent extends SignUpEvent {
  SignUpTitleChangedEvent({
    required this.title,
  });

  final String title;

  @override
  List<Object?> get props => [title];
}

class SignUpFirstNameChangedEvent extends SignUpEvent {
  SignUpFirstNameChangedEvent({
    required this.firstName,
  });

  final String firstName;

  @override
  List<Object?> get props => [firstName];
}

class SignUpLastNameChangedEvent extends SignUpEvent {
  SignUpLastNameChangedEvent({
    required this.lastName,
  });

  final String lastName;

  @override
  List<Object?> get props => [lastName];
}

class SignUpEmailChangedEvent extends SignUpEvent {
  SignUpEmailChangedEvent({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [email];
}

class SignUpRoleChangedEvent extends SignUpEvent {
  SignUpRoleChangedEvent({
    required this.role,
  });

  final String role;

  @override
  List<Object?> get props => [role];
}

class SignUpCreatedDateChangedEvent extends SignUpEvent {
  SignUpCreatedDateChangedEvent({
    required this.createdDate,
  });

  final DateTime createdDate;

  @override
  List<Object?> get props => [createdDate];
}

class SignUpUpdatedDateChangedEvent extends SignUpEvent {
  SignUpUpdatedDateChangedEvent({
    required this.updatedDate,
  });

  final DateTime updatedDate;

  @override
  List<Object?> get props => [updatedDate];
}

class SignUpAgreeChangedEvent extends SignUpEvent {
  SignUpAgreeChangedEvent({
    required this.isChecked,
  });

  final bool isChecked;

  @override
  List<Object?> get props => [isChecked];
}

class SignUpPasswordChangedEvent extends SignUpEvent {
  SignUpPasswordChangedEvent({
    required this.password,
  });

  final String password;

  @override
  List<Object?> get props => [password];
}

class SignUpConfirmPasswordChangedEvent extends SignUpEvent {
  SignUpConfirmPasswordChangedEvent({
    required this.confirmPassword,
  });

  final String confirmPassword;

  @override
  List<Object?> get props => [confirmPassword];
}

class SignUpAcceptTermsChangedEvent extends SignUpEvent {
  SignUpAcceptTermsChangedEvent({
    required this.acceptTerms,
  });

  final bool acceptTerms;

  @override
  List<Object?> get props => [acceptTerms];
}

class SignUpButtonPressedEvent extends SignUpEvent {
  SignUpButtonPressedEvent();

  @override
  List<Object?> get props => [];
}
