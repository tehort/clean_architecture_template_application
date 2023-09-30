import 'package:authentication/src/usecases/authentication_verify_email_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'verify_email_event.dart';
part 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  VerifyEmailBloc({
    required authenticationVerifyEmailUsecase,
  })  : _authenticationVerifyEmailUsecase = authenticationVerifyEmailUsecase,
        super(const VerifyEmailState.initial()) {
    on<VerifyEmailTokenChangedEvent>(_onVerifyEmailTokenChangedEvent);
    on<VerifyEmailButtonPressedEvent>(_onVerifyEmailButtonPressedEvent);
  }

  final AuthenticationVerifyEmailUsecase _authenticationVerifyEmailUsecase;

  void _onVerifyEmailTokenChangedEvent(
    VerifyEmailTokenChangedEvent event,
    Emitter<VerifyEmailState> emit,
  ) {
    emit(state.copyWith(token: event.token));
  }

  Future<void> _onVerifyEmailButtonPressedEvent(
    VerifyEmailButtonPressedEvent event,
    Emitter<VerifyEmailState> emit,
  ) async {
    emit(
      VerifyEmailLoadingState(token: state.token),
    );

    final result = await _authenticationVerifyEmailUsecase.call(
      token: state.token,
    );

    switch (result) {
      case Success<void, Exception>(value: _):
        emit(
          VerifyEmailSuccessState(
            token: state.token,
          ),
        );
      case Failure<void, Exception>(exception: final exception):
        emit(
          VerifyEmailErrorState(
            token: state.token,
            errorMessage: exception.toString(),
          ),
        );
    }
  }
}
