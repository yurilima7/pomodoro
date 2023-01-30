import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';

class ThemeSettings {
  ThemeSettings._();

  static final theme = ThemeData(
    primaryColor: ColorsApp.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.i.primary,
      primary: ColorsApp.i.primary,
      secondary: ColorsApp.i.secondary,
      tertiary: ColorsApp.i.tertiary,
    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsApp.i.white,
      selectionHandleColor: ColorsApp.i.white,
      selectionColor: ColorsApp.i.select,
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyles.i.formText,
      hintStyle: TextStyles.i.litteText,
      floatingLabelBehavior: FloatingLabelBehavior.never,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          width: 3,
          color: ColorsApp.i.secondary,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          width: 3,
          color: ColorsApp.i.secondary,
        ),
      ),

      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 3,
            color: ColorsApp.i.error,
          ),
      ), 

      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 3,
            color: ColorsApp.i.error,
          ),
      ),

      prefixIconColor: ColorsApp.i.white,
      suffixIconColor: ColorsApp.i.white,
      errorStyle: TextStyles.i.errorText,
    ),

    cardTheme: CardTheme(
      color: ColorsApp.i.secondary,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,    
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsApp.i.primary,
      unselectedItemColor: ColorsApp.i.white,
      selectedItemColor: ColorsApp.i.secondary,
      selectedIconTheme: const IconThemeData(size: 32),
      unselectedIconTheme: const IconThemeData(size: 32),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),

    scaffoldBackgroundColor: ColorsApp.i.primary,
  );
}
