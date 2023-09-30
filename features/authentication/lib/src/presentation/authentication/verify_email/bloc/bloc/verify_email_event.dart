part of 'verify_email_bloc.dart';

@immutable
sealed class VerifyEmailEvent extends Equatable {}

class VerifyEmailTokenChangedEvent extends VerifyEmailEvent {
  VerifyEmailTokenChangedEvent({
    required this.token,
  });

  final String token;

  @override
  List<Object?> get props => [token];
}

class VerifyEmailButtonPressedEvent extends VerifyEmailEvent {
  VerifyEmailButtonPressedEvent();

  @override
  List<Object?> get props => [];
}
