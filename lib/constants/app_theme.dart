import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFDFD9CB),
    fontFamily: 'Epilogue',
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: Colors.deepPurple,
      secondary: Colors.amber,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFDFD9CB),
      titleTextStyle: TextStyle(
        fontFamily: 'Epilogue',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        textStyle: const TextStyle(
          fontFamily: 'Epilogue',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    useMaterial3: true,
  );
}