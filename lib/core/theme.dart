import 'package:flutter/material.dart';
import 'constants.dart';

class AppTheme {
  // Theme sáng
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: AppFonts.inter,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textLightThemeColor),
      bodyMedium: TextStyle(color: AppColors.textLightThemeColor),
      titleLarge: TextStyle(
        color: AppColors.textLightThemeColor,
        fontFamily: AppFonts.montserrat,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // Theme tối
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blackColor,
    fontFamily: AppFonts.inter,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textDarkThemeColor),
      bodyMedium: TextStyle(color: AppColors.textDarkThemeColor),
      titleLarge: TextStyle(
        color: AppColors.textDarkThemeColor,
        fontFamily: AppFonts.montserrat,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
