part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

final class ThemeEventToggle extends ThemeEvent {}

final class ThemeEventAppStartedEvent extends ThemeEvent {}
