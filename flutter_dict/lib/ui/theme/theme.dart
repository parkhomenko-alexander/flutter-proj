import 'package:flutter/material.dart';

const Color thirdColor = Color.fromRGBO(249, 168, 37, 1);

final ThemeData theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: const ColorScheme.dark(
    tertiary: thirdColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black12,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Colors.black,
    focusColor: Color.fromARGB(255, 140, 9, 9),
    contentPadding: EdgeInsets.all(10.0),
    floatingLabelStyle: TextStyle(color: thirdColor),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: thirdColor, // Set the desired border color
        width: 2.0, // Set the desired border width
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: thirdColor, // Same border color as the default border
        width: 2.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: thirdColor, // Same border color as the default border
        width: 2.0,
      ),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white, // Set the cursor color
  ),
);
