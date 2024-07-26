import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme:  ColorScheme.light(
    surface: Colors.grey[300]!,
    primary: Colors.grey[200]!,
    secondary: Colors.grey[400]!,
    inversePrimary: Colors.grey.shade800,
  ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.grey[800],
      displayColor: Colors.black
    )

);