import 'package:flutter/material.dart';

class CustomTextTheme {
  ///private constructore
  CustomTextTheme._();
  static TextTheme lightTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
    bodyLarge: TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
    labelLarge: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Poppins',
    ),
  );
  static TextTheme darkTheme = const TextTheme(
    // white is the color.  because most text are white in dark theme, but we
    // can override this use of copy if we'd want.
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    bodyLarge: TextStyle(
      fontSize: 30,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    labelLarge: TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
  );
}
