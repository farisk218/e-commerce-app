import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.dmSansTextTheme(),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.primaryLight,
      // onPrimaryContainer: AppColors.primaryDark,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.secondary,
      onSecondaryContainer: AppColors.darker,
      background: AppColors.bgColor,
      onBackground: AppColors.black,
      surface: AppColors.light1,
      onSurface: AppColors.black,
      error: AppColors.red,
      onError: AppColors.white,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      labelStyle: TextStyle(
        color: AppColors.black.withOpacity(0.8),
      ),
      errorStyle: TextStyle(
        color: AppColors.red.withOpacity(0.6),
      ),
      errorMaxLines: 5,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: AppColors.primaryLight.withOpacity(0.1),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: AppColors.primaryLight.withOpacity(0.3),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: AppColors.primaryLight.withOpacity(0.9),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: AppColors.primaryLight.withOpacity(0.2),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
        foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryLight),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        )),
      ),
    ),
  );
}
