import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();
  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get button => ElevatedButton.styleFrom(
    backgroundColor: ColorsApp.i.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    textStyle: TextStyles.i.buttonTitle,
    minimumSize: const Size.fromHeight(50.0),
  );

  ButtonStyle get optButtonCancel => ElevatedButton.styleFrom(
    backgroundColor: ColorsApp.i.tertiary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    textStyle: TextStyles.i.buttonTitle,
  );

  ButtonStyle get optButton => ElevatedButton.styleFrom(
    backgroundColor: ColorsApp.i.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    textStyle: TextStyles.i.buttonTitle,
  );
}

extension ButtonStyleExtensions on BuildContext {
  ButtonStyles get buttons => ButtonStyles.i;
}
