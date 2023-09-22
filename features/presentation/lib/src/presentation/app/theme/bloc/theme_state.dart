part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState(this.themeData);

  final ThemeData themeData;

  @override
  List<Object> get props => [themeData];
}

class DarkThemeState extends ThemeState {
  DarkThemeState()
      : super(
          ThemeData(
            primarySwatch: Colors.purple,
            brightness: Brightness.dark,
          ),
        );
}

class LightThemeState extends ThemeState {
  LightThemeState()
      : super(
          ThemeData(
            primarySwatch: Colors.purple,
            brightness: Brightness.light,
          ),
        );
}
