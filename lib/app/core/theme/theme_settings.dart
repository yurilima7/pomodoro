import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_styles.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';

class ThemeSettings {
  ThemeSettings._();

  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorsStyles.primary,
      secondary: ColorsStyles.secondary,
      tertiary: ColorsStyles.tertiary,
    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsStyles.white,
      selectionHandleColor: ColorsStyles.white,
      selectionColor: ColorsStyles.select,
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyles().formText,
      hintStyle: TextStyles().litteText,
      floatingLabelBehavior: FloatingLabelBehavior.never,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          width: 3,
          color: ColorsStyles.secondary,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          width: 3,
          color: ColorsStyles.secondary,
        ),
      ),

      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 3,
            color: ColorsStyles.error,
          ),
      ), 

      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 3,
            color: ColorsStyles.error,
          ),
      ),

      prefixIconColor: ColorsStyles.white,
      suffixIconColor: ColorsStyles.white,
      errorStyle: TextStyles().errorText,
    ),

    cardTheme: CardTheme(
      color: ColorsStyles.secondary,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,    
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsStyles.primary,
      unselectedItemColor: ColorsStyles.white,
      selectedItemColor: ColorsStyles.secondary,
      selectedIconTheme: const IconThemeData(size: 32),
      unselectedIconTheme: const IconThemeData(size: 32),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),

    scaffoldBackgroundColor: ColorsStyles.primary,
  );
}
