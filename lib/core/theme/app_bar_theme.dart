import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();
  static AppBarTheme lightTheme = AppBarTheme(
    backgroundColor: AppColors.surfaceLight,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.onSurfaceLight,
      fontFamily: 'Poppins',
    ),
  );
  static AppBarTheme darkTheme = AppBarTheme(
    backgroundColor: AppColors.surfaceDark,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.onSurfaceDark,
      fontFamily: 'Poppins',
    ),
  );
}
