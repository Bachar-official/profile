import 'package:flutter/material.dart';

enum Themes {
  light,
  dark;

  ThemeData get theme => this == Themes.light ? lightTheme : darkTheme;
  Themes get next => this == Themes.light ? Themes.dark : Themes.light;
}

final ThemeData lightTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.light),
);

final ThemeData darkTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.dark),
);
