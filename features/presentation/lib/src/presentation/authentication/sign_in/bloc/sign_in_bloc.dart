import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/src/core/result.dart';
import 'package:domain/src/usecases/authentication_sign_in_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:presentation/src/presentation/authentication/authentication/bloc/authentication_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required authenticationSignInUsecase,
    required authenticationBloc,
  })  : _authenticationSignInUsecase = authenticationSignInUsecase,
        _authenticationBloc = authenticationBloc,
        super(const SignInState.initial()) {
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<RememberMeChanged>(_onRememberMeChanged);
    on<SignInButtonPressed>(_onSignInButtonPressed);
    on<SignUpButtonPressed>(_onSignUpButtonPressed);
  }

  final AuthenticationSignInUsecase _authenticationSignInUsecase;
  final AuthenticationBloc _authenticationBloc;

  Future<void> _onUsernameChanged(
    UsernameChanged event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(username: event.username));
  }

  Future<void> _onPasswordChanged(
    PasswordChanged event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onRememberMeChanged(
    RememberMeChanged event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(rememberMe: event.rememberMe));
  }

  Future<void> _onSignInButtonPressed(
    SignInButtonPressed event,
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
    );

    switch (result) {
      case Success<void, Exception>(value: _):
        _authenticationBloc.add(LoggedIn());
      case Failure<void, Exception>(exception: final exception):
        emit(
          SignInErrorState(
            rememberMe: state.rememberMe,
            username: state.username,
            password: state.password,
            errorMessage: exception.toString(),
          ),
        );
    }
  }

  Future<void> _onSignUpButtonPressed(
    SignUpButtonPressed event,
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