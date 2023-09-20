part of 'verify_email_bloc.dart';

class VerifyEmailState extends Equatable {
  const VerifyEmailState({
    required this.token,
  });

  const VerifyEmailState.initial() : token = '';

  final String token;

  VerifyEmailState copyWith({
    String? token,
  }) {
    return VerifyEmailState(
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [
        token,
      ];
}

class VerifyEmailLoadingState extends VerifyEmailState {
  const VerifyEmailLoadingState({
    required super.token,
  });
}

class VerifyEmailSuccessState extends VerifyEmailState {
  const VerifyEmailSuccessState({
    required super.token,
  });
}

class VerifyEmailErrorState extends VerifyEmailState {
  const VerifyEmailErrorState({
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
