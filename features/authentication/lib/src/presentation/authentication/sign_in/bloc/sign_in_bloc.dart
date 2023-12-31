import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:usecases/usecases.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required signInUsecase,
    required authenticationBloc,
  })  : _authenticationSignInUsecase = signInUsecase,
        _authenticationBloc = authenticationBloc,
        super(const SignInState.initial()) {
    on<SignInUsernameChangedEvent>(_onSignInUsernameChanged);
    on<SignInPasswordChangedEvent>(_onSignInPasswordChanged);
    on<SignInRememberMeChangedEvent>(_onSignInRememberMeChanged);
    on<SignInSignInButtonPressedEvent>(_onSignInSignInButtonPressed);
    on<SignInSignUpButtonPressedEvent>(_onSignInSignUpButtonPressed);
  }

  final SignInUseCase _authenticationSignInUsecase;
  final AuthenticationBloc _authenticationBloc;

  Future<void> _onSignInUsernameChanged(
    SignInUsernameChangedEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(username: event.username));
  }

  Future<void> _onSignInPasswordChanged(
    SignInPasswordChangedEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onSignInRememberMeChanged(
    SignInRememberMeChangedEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(rememberMe: event.rememberMe));
  }

  Future<void> _onSignInSignInButtonPressed(
    SignInSignInButtonPressedEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(
      SignInLoadingState(
        rememberMe: state.rememberMe,
        username: state.username,
        password: state.password,
      ),
    );

    final result = await _authenticationSignInUsecase.call(
      username: state.username,
      password: state.password,
      keepSignedIn: state.rememberMe,
    );

    switch (result) {
      case Success<AuthenticationInfo, Exception>(value: _):
        _authenticationBloc.add(LoggedIn(authenticationInfo: result.value));
      case Failure<AuthenticationInfo, Exception>(exception: final exception):
        emit(
          SignInErrorState(
            username: state.username,
            password: state.password,
            rememberMe: state.rememberMe,
            errorMessage: exception.toString(),
          ),
        );
    }
  }

  Future<void> _onSignInSignUpButtonPressed(
    SignInSignUpButtonPressedEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(
      SignInLoadingState(
        rememberMe: state.rememberMe,
        username: state.username,
        password: state.password,
      ),
    );
  }
}
