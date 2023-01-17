import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_styles.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';

class ButtonStyles {
  ButtonStyle get button => ElevatedButton.styleFrom(
    backgroundColor: ColorsStyles.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    textStyle: TextStyles().buttonTitle,
    minimumSize: const Size.fromHeight(50.0),
  );

  ButtonStyle get optButtonCancel => ElevatedButton.styleFrom(
    backgroundColor: ColorsStyles.tertiary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    textStyle: TextStyles().buttonTitle,
  );

  ButtonStyle get optButton => ElevatedButton.styleFrom(
    backgroundColor: ColorsStyles.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    textStyle: TextStyles().buttonTitle,
  );
}
