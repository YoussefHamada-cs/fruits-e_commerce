import 'package:flutter/material.dart';
//import 'package:fruits_hub/core/utils/app_colors.dart';


class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Cairo',
      useMaterial3: true,
      brightness: Brightness.light,
    
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
        titleLarge: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        displayMedium: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 26,
          fontWeight: FontWeight.normal,
        ),
        displaySmall: TextStyle(
            fontFamily: 'Cairo',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontFamily: 'Cairo',
        ),
        bodyMedium: TextStyle(
          
          fontSize: 15,
          fontFamily: 'Cairo',
        ),
        bodySmall: TextStyle(
          fontSize: 11,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.normal,
        ),
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
