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
    ),

    cardTheme: CardTheme(
      color: ColorsStyles.secondary,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    ),

    scaffoldBackgroundColor: ColorsStyles.primary,
  );
}
