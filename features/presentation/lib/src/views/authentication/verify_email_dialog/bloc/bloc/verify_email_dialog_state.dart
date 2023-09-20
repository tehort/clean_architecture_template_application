part of 'verify_email_dialog_bloc.dart';

class VerifyEmailDialogState extends Equatable {
  const VerifyEmailDialogState({
    required this.token,
  });

  const VerifyEmailDialogState.initial() : token = '';

  final String token;

  VerifyEmailDialogState copyWith({
    String? token,
  }) {
    return VerifyEmailDialogState(
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [
        token,
      ];
}

class VerifyEmailDialogLoadingState extends VerifyEmailDialogState {
  const VerifyEmailDialogLoadingState({
    required super.token,
  });
}

class VerifyEmailDialogSuccessState extends VerifyEmailDialogState {
  const VerifyEmailDialogSuccessState({
    required super.token,
  });
}

class VerifyEmailDialogErrorState extends VerifyEmailDialogState {
  const VerifyEmailDialogErrorState({
    required super.token,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [
        ...super.props,
        errorMessage,
      ];
}
