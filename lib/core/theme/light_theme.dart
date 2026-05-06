// import 'package:flutter/material.dart';
// import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
// import 'package:vegetarian_super_hero/utils/config/app_config.dart';
// 
// final ThemeData lightTheme = ThemeData(
//   brightness: Brightness.light,
//   scaffoldBackgroundColor: AppColors.backgroundColor,
//   fontFamily: AppConfig.secondaryFont,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: AppColors.backgroundColor,
//     elevation: 0,
//     centerTitle: true,
//     iconTheme: IconThemeData(color: AppColors.brandHoverColor),
//     titleTextStyle: TextStyle(
//       color: AppColors.lightTextPrimary,
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 18,
//       fontWeight: FontWeight.w600,
//     ),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: AppColors.primaryText,
//       foregroundColor: AppColors.white,
//       minimumSize: const Size(186, 48),
//       padding: const EdgeInsets.all(10),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       textStyle: const TextStyle(
//         fontFamily: AppConfig.primaryFont,
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//   ),
//   outlinedButtonTheme: OutlinedButtonThemeData(
//     style: OutlinedButton.styleFrom(
//       side: const BorderSide(color: AppColors.primaryText, width: 1.5),
//       foregroundColor: AppColors.primaryText,
//       minimumSize: const Size(186, 48),
//       padding: const EdgeInsets.all(10),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       textStyle: const TextStyle(
//         fontFamily: AppConfig.primaryFont,
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//   ),
//   textButtonTheme: TextButtonThemeData(
//     style: TextButton.styleFrom(
//       foregroundColor: AppColors.primaryText,
//       textStyle: const TextStyle(
//         fontFamily: AppConfig.primaryFont,
//         fontWeight: FontWeight.w600,
//         fontSize: 14,
//         decoration: TextDecoration.underline,
//       ),
//     ),
//   ),
//   iconTheme: const IconThemeData(
//     color: AppColors.primaryText,
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     filled: true,
//     fillColor: AppColors.white,
//     iconColor: AppColors.lightTextPrimary,
//     prefixIconColor: AppColors.lightTextPrimary,
//     suffixIconColor: AppColors.lightTextPrimary,
//     contentPadding: const EdgeInsets.symmetric(
//       horizontal: 15,
//       vertical: 14,
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: AppColors.borderColor),
//     ),
//     errorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(
//         width: 2,
//         color: AppColors.errorColor,
//       ),
//     ),
//     focusedErrorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(
//         width: 2,
//         color: AppColors.errorColor,
//       ),
//     ),
//     disabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: Colors.transparent),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: AppColors.primaryText),
//     ),
//     hintStyle: const TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: AppColors.secondaryText,
//     ),
//     errorStyle: const TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 12,
//       fontWeight: FontWeight.w400,
//       color: AppColors.errorColor,
//     ),
//   ),
//   textTheme: const TextTheme(
//     headlineLarge: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 32,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextPrimary,
//     ),
//     headlineMedium: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 28,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextPrimary,
//     ),
//     headlineSmall: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 24,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextPrimary,
//     ),
//     titleLarge: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 22,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextPrimary,
//     ),
//     titleMedium: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 16,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextPrimary,
//     ),
//     titleSmall: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 14,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextPrimary,
//     ),
//     bodyLarge: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 14,
//       fontWeight: FontWeight.w500,
//       color: AppColors.secondaryText,
//     ),
//     bodyMedium: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//       color: AppColors.secondaryText,
//     ),
//     bodySmall: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 10,
//       fontWeight: FontWeight.w500,
//       color: AppColors.secondaryText,
//     ),
//     labelLarge: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       color: AppColors.lightTextPrimary,
//     ),
//     labelMedium: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 14,
//       fontWeight: FontWeight.w500,
//       color: AppColors.lightTextPrimary,
//     ),
//     labelSmall: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//       color: AppColors.lightTextPrimary,
//     ),
//   ),
// );