import 'package:flutter/material.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/config/app_config.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkBackground,
  fontFamily: AppConfig.secondaryFont,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBackground,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.darkPrimary),
    titleTextStyle: const TextStyle(
      color: AppColors.white,
      fontFamily: AppConfig.primaryFont,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: AppColors.darkSurface,
      minimumSize: const Size(186, 48),
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(
        fontFamily: AppConfig.primaryFont,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.darkPrimary, width: 1.5),
      foregroundColor: AppColors.darkPrimary,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.darkPrimary,
      textStyle: const TextStyle(
        fontFamily: AppConfig.primaryFont,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        decoration: TextDecoration.underline,
      ),
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.darkPrimary),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkSurface,
    iconColor: AppColors.darkPrimary,
    prefixIconColor: AppColors.darkPrimary,
    suffixIconColor: AppColors.darkPrimary,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.darkBorder),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.darkPrimary, width: 1.5),
    ),
    hintStyle: const TextStyle(
      fontFamily: AppConfig.secondaryFont,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.darkSecondaryText,
    ),
    errorStyle: const TextStyle(
      fontFamily: AppConfig.secondaryFont,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.error,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: AppConfig.primaryFont,
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    headlineMedium: TextStyle(
      fontFamily: AppConfig.primaryFont,
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    headlineSmall: TextStyle(
      fontFamily: AppConfig.primaryFont,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    titleLarge: TextStyle(
      fontFamily: AppConfig.primaryFont,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: AppConfig.primaryFont,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: AppConfig.primaryFont,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppConfig.secondaryFont,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.darkSecondaryText,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppConfig.secondaryFont,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.darkSecondaryText,
    ),
    bodySmall: TextStyle(
      fontFamily: AppConfig.secondaryFont,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.darkSecondaryText,
    ),
    labelLarge: TextStyle(
      fontFamily: AppConfig.secondaryFont,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    labelMedium: TextStyle(
      fontFamily: AppConfig.secondaryFont,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: AppConfig.secondaryFont,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
  ),
);
