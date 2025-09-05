import 'package:flutter/material.dart';

class AppTheme {

  static OutlineInputBorder  _border(width, Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: width,
        ),
        borderRadius: BorderRadius.circular(15),
      );

  static final darkTheme = ThemeData.dark().copyWith(
    chipTheme: ChipThemeData(
      side: BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(20),
      enabledBorder: _border(1.0, Colors.grey.shade900),
      focusedBorder: _border(2.0, Colors.white),
      errorBorder: _border(1.0, Colors.red),
      focusedErrorBorder: _border(1.0, Colors.red),
      filled: true,
      fillColor: Colors.black54,
    ),
  );
}