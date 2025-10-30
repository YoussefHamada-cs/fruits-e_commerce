import 'package:flutter/material.dart';
//import 'package:fruits_hub/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Cairo',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        toolbarHeight: 65,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),

      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
      ),

      // inputDecorationTheme: InputDecorationTheme(
      //   filled: true,
      //   fillColor: AppColors.inputBackgroundLight,
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(12),
      //     borderSide: BorderSide.none,
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(12),
      //     borderSide: BorderSide.none,
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(12),
      //     borderSide: const BorderSide(color: AppColors.primary),
      //   ),
      //   errorBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(12),
      //     borderSide: const BorderSide(color: AppColors.error),
      //   ),
      //   contentPadding: const EdgeInsets.symmetric(
      //     horizontal: 16,
      //     vertical: 12,
      //   ),
      // ),
    );
  }
}
