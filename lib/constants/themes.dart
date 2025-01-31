import 'package:flutter/material.dart';

enum Themes {
  light,
  dark;

  ThemeData get theme => this == Themes.light ? lightTheme : darkTheme;
  Themes get next => this == Themes.light ? Themes.dark : Themes.light;
  String get name => this == Themes.light ? 'light' : 'dark';
}

final ThemeData lightTheme = ThemeData(
  fontFamily: 'OpenSans',
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.white,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.white,
    onSurface: Colors.black,
    tertiary: Colors.white,
    onTertiary: Colors.black,
  ),
  cardTheme: const CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
      side: BorderSide.none,
    ),
    elevation: 5,
    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    clipBehavior: Clip.antiAlias,
  ),
);

final ThemeData darkTheme = ThemeData(
  fontFamily: 'OpenSans',
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.white,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.black,
    onSurface: Colors.white,
    tertiary: Colors.black,
    onTertiary: Colors.white,
  ),
  cardTheme: const CardTheme(
    shadowColor: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
      side: BorderSide.none,
    ),
    elevation: 5,
    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    clipBehavior: Clip.antiAlias,
  ),
);
