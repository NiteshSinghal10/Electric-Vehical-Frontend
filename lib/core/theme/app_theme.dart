import 'package:flutter/material.dart';
import 'app_bar_theme.dart';
import 'app_colors.dart';
import 'text_styles.dart';

//if we need some more theme we can add here
class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.light(
      primary: AppColors.primeryLight,
      secondary: AppColors.secoundryLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
      error: AppColors.error,
    ),
    textTheme: CustomTextTheme.lightTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primeryLight,
    ),
    scaffoldBackgroundColor: AppColors.surfaceLight,
    appBarTheme: CustomAppBarTheme.lightTheme,
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.dark(
      primary: AppColors.primeryDark,
      secondary: AppColors.secoundryDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      error: AppColors.error,
    ),
    textTheme: CustomTextTheme.darkTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primeryDark,
    ),
    scaffoldBackgroundColor: AppColors.surfaceDark,
    appBarTheme: CustomAppBarTheme.darkTheme,
  );
}
