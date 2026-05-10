import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF6F6EF),
    primaryColor: const Color(0xFFFF6600),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFF6600),
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    fontFamily: 'Arial',
  );
}