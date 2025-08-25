import 'package:flutter/material.dart';

class AppTheme {

  static OutlineInputBorder  _border(width) => OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green.shade800,
          width: width,
        ),
        borderRadius: BorderRadius.circular(15),
      );

  static final darkTheme = ThemeData.dark().copyWith(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(20),
      enabledBorder: _border(1.0),
      focusedBorder: _border(3.0),
      filled: true,
      fillColor: Colors.black54,
    ),
  );
}