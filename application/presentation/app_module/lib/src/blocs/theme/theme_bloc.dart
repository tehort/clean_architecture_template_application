import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    on<ThemeEventToggle>(_onThemeEventToggle);
    on<ThemeEventAppStartedEvent>(_onThemeEventAppStartedEvent);
  }

  void _onThemeEventAppStartedEvent(
    ThemeEventAppStartedEvent event,
    Emitter<ThemeState> emit,
  ) {
    if (state is LightThemeState) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  void _onThemeEventToggle(
    ThemeEventToggle event,
    Emitter<ThemeState> emit,
  ) {
    if (state is LightThemeState) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }
}
