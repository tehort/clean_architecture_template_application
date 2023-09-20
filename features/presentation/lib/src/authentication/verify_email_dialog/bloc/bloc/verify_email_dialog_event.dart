part of 'verify_email_dialog_bloc.dart';

@immutable
sealed class VerifyEmailDialogEvent extends Equatable {}

class VerifyEmailDialogTokenChangedEvent extends VerifyEmailDialogEvent {
  VerifyEmailDialogTokenChangedEvent({
    required this.token,
  });

  final String token;

  @override
  List<Object?> get props => [token];
}

class VerifyEmailDialogButtonPressedEvent extends VerifyEmailDialogEvent {
  VerifyEmailDialogButtonPressedEvent();

  @override
  List<Object?> get props => [];
}
