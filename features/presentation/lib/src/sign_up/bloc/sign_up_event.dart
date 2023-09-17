part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {}

class UsernameChanged extends SignUpEvent {
  UsernameChanged({
    required this.username,
  });

  final String username;

  @override
  List<Object?> get props => [username];
}

class TitleChanged extends SignUpEvent {
  TitleChanged({
    required this.title,
  });

  final String title;

  @override
  List<Object?> get props => [title];
}

class FirstNameChanged extends SignUpEvent {
  FirstNameChanged({
    required this.firstName,
  });

  final String firstName;

  @override
  List<Object?> get props => [firstName];
}

class LastNameChanged extends SignUpEvent {
  LastNameChanged({
    required this.lastName,
  });

  final String lastName;

  @override
  List<Object?> get props => [lastName];
}

class EmailChanged extends SignUpEvent {
  EmailChanged({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [email];
}

class RoleChanged extends SignUpEvent {
  RoleChanged({
    required this.role,
  });

  final String role;

  @override
  List<Object?> get props => [role];
}

class CreatedDateChanged extends SignUpEvent {
  CreatedDateChanged({
    required this.createdDate,
  });

  final DateTime createdDate;

  @override
  List<Object?> get props => [createdDate];
}

class UpdatedDateChanged extends SignUpEvent {
  UpdatedDateChanged({
    required this.updatedDate,
  });

  final DateTime updatedDate;

  @override
  List<Object?> get props => [updatedDate];
}

class AgreeChanged extends SignUpEvent {
  AgreeChanged({
    required this.isChecked,
  });

  final bool isChecked;

  @override
  List<Object?> get props => [isChecked];
}

class PasswordChanged extends SignUpEvent {
  PasswordChanged({
    required this.password,
  });

  final String password;

  @override
  List<Object?> get props => [password];
}

class ConfirmPasswordChanged extends SignUpEvent {
  ConfirmPasswordChanged({
    required this.confirmPassword,
  });

  final String confirmPassword;

  @override
  List<Object?> get props => [confirmPassword];
}
