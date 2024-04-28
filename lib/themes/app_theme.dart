import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme:
      const ColorScheme.light(primary: Colors.black, secondary: Colors.white),
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.black,
  colorScheme:
      const ColorScheme.light(primary: Colors.white, secondary: Colors.black),
);
