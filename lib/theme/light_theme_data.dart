
import 'package:flight_log_book/app.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTheme {
  static ThemeData getLightThemeData() {
    return ThemeData(
      colorScheme: const ColorScheme(
        primary: Colors.redAccent,//Color(0xff023E73),
        secondary: Colors.white,
        background: Colors.white,//Color(0xffD8EBF2),
        surface: Colors.white,//Color(0xffD8EBF2),
        brightness: Brightness.light,
        error: Colors.redAccent,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onBackground: Colors.black,
        onSurface: Colors.black,
        onError: Colors.black,
        onSecondaryContainer: Colors.black45,
      ),

      useMaterial3: true,

      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
          color: AppColors.primaryColor,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          letterSpacing: 0.4,
          color: AppColors.secondaryColor,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          color: Colors.black54,
          letterSpacing: 0.4,
        ),
        displayLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
          color: AppColors.primaryColor,
        ),
        displayMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
          //color: AppColors.secondaryColor,
        ),
        displaySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
          color: Colors.black54,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        //filled: true,
        //fillColor: AppColors.thirdColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
          color: AppColors.primaryColor,
        ),
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
          color: AppColors.blackColor,
        ),
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
          color: Colors.black54,
        ),

        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blackColor.withOpacity(0.4),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor.withOpacity(0.4),
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
          ),
        ),

        suffixIconColor: AppColors.primaryColor,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
                fontSize: 16, letterSpacing: 0.4, fontWeight: FontWeight.bold,),),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        backgroundColor: Color(0xff9AC1D9),
        type: BottomNavigationBarType.shifting,
      ),

      cardTheme: CardTheme(
        color: AppColors.whiteColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        surfaceTintColor: AppColors.whiteColor,
      ),

      expansionTileTheme: ExpansionTileThemeData(
        tilePadding: EdgeInsets.zero,
        collapsedBackgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      )
    );
  }
}
