import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:usecases/usecases.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required signUpUsecase,
  })  : _authenticationSignUpUsecase = signUpUsecase,
        super(
          const SignUpState.initial(),
        ) {
    on<SignUpTitleChangedEvent>(_onSignUpTitleChanged);
    on<SignUpFirstNameChangedEvent>(_onSignUpFirstNameChanged);
    on<SignUpLastNameChangedEvent>(_onSignUpLastNameChanged);
    on<SignUpEmailChangedEvent>(_onSignUpEmailChanged);
    on<SignUpPasswordChangedEvent>(_onSignUpPasswordChanged);
    on<SignUpConfirmPasswordChangedEvent>(_onSignUpConfirmPasswordChanged);
    on<SignUpButtonPressedEvent>(_onSignUpButtonPressedEvent);
    on<SignUpAcceptTermsChangedEvent>(_onSignUpAcceptTermsChangedEvent);
  }

  final SignUpUseCase _authenticationSignUpUsecase;

  void _onSignUpTitleChanged(
    SignUpTitleChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onSignUpFirstNameChanged(
    SignUpFirstNameChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(firstName: event.firstName));
  }

  void _onSignUpLastNameChanged(
    SignUpLastNameChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(lastName: event.lastName));
  }

  void _onSignUpEmailChanged(
    SignUpEmailChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onSignUpPasswordChanged(
    SignUpPasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onSignUpConfirmPasswordChanged(
    SignUpConfirmPasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _onSignUpAcceptTermsChangedEvent(
    SignUpAcceptTermsChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(acceptTerms: event.acceptTerms));
  }

  Future<void> _onSignUpButtonPressedEvent(
    SignUpButtonPressedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      SignUpLoadingState(
        title: state.title,
        firstName: state.firstName,
        lastName: state.lastName,
        email: state.email,
        password: state.password,
        confirmPassword: state.confirmPassword,
        acceptTerms: state.acceptTerms,
      ),
    );

    final result = await _authenticationSignUpUsecase.call(
      title: state.title,
      firstName: state.firstName,
      lastName: state.lastName,
      email: state.email,
      password: state.password,
      confirmPassword: state.confirmPassword,
      acceptTerms: state.acceptTerms,
    );

    switch (result) {
      case Success<String, Exception>(value: final message):
        emit(
          SignUpShowSnackbarState(
            title: state.title,
            firstName: state.firstName,
            lastName: state.lastName,
            email: state.email,
            password: state.password,
            confirmPassword: state.confirmPassword,
            acceptTerms: state.acceptTerms,
            message: message,
          ),
        );
      case Failure<String, Exception>(exception: final exception):
        emit(
          SignUpErrorState(
            title: state.title,
            firstName: state.firstName,
            lastName: state.lastName,
            email: state.email,
            password: state.password,
            confirmPassword: state.confirmPassword,
            acceptTerms: state.acceptTerms,
            errorMessage: exception.toString(),
          ),
        );
    }
  }
}
