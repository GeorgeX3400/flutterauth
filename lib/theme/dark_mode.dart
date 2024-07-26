import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme:  ColorScheme.dark(
    surface: Colors.grey[900]!,
    primary: Colors.grey[400]!,
    secondary: Colors.grey[700]!,
    inversePrimary: Colors.grey.shade300,
  ),
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: Colors.grey[300],
      displayColor: Colors.black
    )

);
