// import 'package:flutter/material.dart';
// import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
// import 'package:vegetarian_super_hero/utils/config/app_config.dart';
// 
// final ThemeData lightTheme = ThemeData(
//   brightness: Brightness.light,
//   scaffoldBackgroundColor: AppColors.lightBackground,
//   fontFamily: AppConfig.secondaryFont,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: AppColors.lightBackground,
//     elevation: 0,
//     centerTitle: true,
//     iconTheme: IconThemeData(color: AppColors.brandDarkSurface),
//     titleTextStyle: TextStyle(
//       color: AppColors.lightTextMain,
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 18,
//       fontWeight: FontWeight.w600,
//     ),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: AppColors.brandPrimary,
//       foregroundColor: AppColors.pureWhite,
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
//       side: const BorderSide(color: AppColors.brandPrimary, width: 1.5),
//       foregroundColor: AppColors.brandPrimary,
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
//       foregroundColor: AppColors.brandPrimary,
//       textStyle: const TextStyle(
//         fontFamily: AppConfig.primaryFont,
//         fontWeight: FontWeight.w600,
//         fontSize: 14,
//         decoration: TextDecoration.underline,
//       ),
//     ),
//   ),
//   iconTheme: const IconThemeData(
//     color: AppColors.brandPrimary,
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     filled: true,
//     fillColor: AppColors.pureWhite,
//     iconColor: AppColors.lightTextMain,
//     prefixIconColor: AppColors.lightTextMain,
//     suffixIconColor: AppColors.lightTextMain,
//     contentPadding: const EdgeInsets.symmetric(
//       horizontal: 15,
//       vertical: 14,
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: AppColors.lightBorder),
//     ),
//     errorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(
//         width: 2,
//         color: AppColors.semanticError,
//       ),
//     ),
//     focusedErrorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(
//         width: 2,
//         color: AppColors.semanticError,
//       ),
//     ),
//     disabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: Colors.transparent),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: AppColors.brandPrimary),
//     ),
//     hintStyle: const TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: AppColors.lightTextSecondary,
//     ),
//     errorStyle: const TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 12,
//       fontWeight: FontWeight.w400,
//       color: AppColors.semanticError,
//     ),
//   ),
//   textTheme: const TextTheme(
//     headlineLarge: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 32,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextMain,
//     ),
//     headlineMedium: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 28,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextMain,
//     ),
//     headlineSmall: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 24,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextMain,
//     ),
//     titleLarge: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 22,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextMain,
//     ),
//     titleMedium: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 16,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextMain,
//     ),
//     titleSmall: TextStyle(
//       fontFamily: AppConfig.primaryFont,
//       fontSize: 14,
//       fontWeight: FontWeight.w600,
//       color: AppColors.lightTextMain,
//     ),
//     bodyLarge: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 14,
//       fontWeight: FontWeight.w500,
//       color: AppColors.lightTextSecondary,
//     ),
//     bodyMedium: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//       color: AppColors.lightTextSecondary,
//     ),
//     bodySmall: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 10,
//       fontWeight: FontWeight.w500,
//       color: AppColors.lightTextSecondary,
//     ),
//     labelLarge: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       color: AppColors.lightTextMain,
//     ),
//     labelMedium: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 14,
//       fontWeight: FontWeight.w500,
//       color: AppColors.lightTextMain,
//     ),
//     labelSmall: TextStyle(
//       fontFamily: AppConfig.secondaryFont,
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//       color: AppColors.lightTextMain,
//     ),
//   ),
// );