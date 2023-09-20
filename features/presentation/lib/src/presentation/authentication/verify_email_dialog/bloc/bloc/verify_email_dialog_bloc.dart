import 'package:bloc/bloc.dart';
import 'package:domain/src/core/result.dart';
import 'package:domain/src/usecases/authentication_verify_email_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'verify_email_dialog_event.dart';
part 'verify_email_dialog_state.dart';

class VerifyEmailDialogBloc extends Bloc<VerifyEmailDialogEvent, VerifyEmailDialogState> {
  VerifyEmailDialogBloc({
    required authenticationVerifyEmailUsecase,
  })  : _authenticationVerifyEmailUsecase = authenticationVerifyEmailUsecase,
        super(const VerifyEmailDialogState.initial()) {
    on<VerifyEmailDialogTokenChangedEvent>(_onVerifyEmailDialogTokenChangedEvent);
    on<VerifyEmailDialogButtonPressedEvent>(_onVerifyEmailDialogButtonPressedEvent);
  }

  final AuthenticationVerifyEmailUsecase _authenticationVerifyEmailUsecase;

  void _onVerifyEmailDialogTokenChangedEvent(
    VerifyEmailDialogTokenChangedEvent event,
    Emitter<VerifyEmailDialogState> emit,
  ) {
    emit(state.copyWith(token: event.token));
  }

  Future<void> _onVerifyEmailDialogButtonPressedEvent(
    VerifyEmailDialogButtonPressedEvent event,
    Emitter<VerifyEmailDialogState> emit,
  ) async {
    emit(
      VerifyEmailDialogLoadingState(token: state.token),
    );

    final result = await _authenticationVerifyEmailUsecase.call(
      token: state.token,
    );

    switch (result) {
      case Success<void, Exception>(value: _):
        emit(
          VerifyEmailDialogSuccessState(
            token: state.token,
          ),
        );
      case Failure<void, Exception>(exception: final exception):
        emit(
          VerifyEmailDialogErrorState(
            token: state.token,
            errorMessage: exception.toString(),
          ),
        );
    }
  }
}
