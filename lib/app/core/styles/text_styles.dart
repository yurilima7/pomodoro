import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();
  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Roboto';
  String get secondaryFont => 'Montserrat';

  TextStyle get primaryRegular => TextStyle(
        color: ColorsApp.i.white,
        fontFamily: primaryFont,
        fontWeight: FontWeight.w400,
      );

  TextStyle get primaryBold => TextStyle(
        color: ColorsApp.i.white,
        fontFamily: primaryFont,
        fontWeight: FontWeight.w700,
      );

  TextStyle get secondaryRegular => TextStyle(
        color: ColorsApp.i.white,
        fontFamily: secondaryFont,
        fontWeight: FontWeight.w400,
      );

  TextStyle get secondaryBold => TextStyle(
        color: ColorsApp.i.white,
        fontFamily: secondaryFont,
        fontWeight: FontWeight.w700,
      );

  TextStyle get errorText => TextStyle(color: ColorsApp.i.error);

  TextStyle get buttonTitle => primaryBold.copyWith(
        fontSize: 24,
      );

  TextStyle get formText => primaryRegular.copyWith(
        fontSize: 18,
      );

  TextStyle get litteText => primaryRegular.copyWith(
        fontSize: 12,
      );

  TextStyle get title => secondaryBold.copyWith(
        fontSize: 25,
      );

  TextStyle get titleSecondary => secondaryBold.copyWith(
        fontSize: 22,
      );

  TextStyle get titleTertiary => secondaryBold.copyWith(
        fontSize: 14,
      );

  TextStyle get cardTitle => secondaryBold.copyWith(
        fontSize: 16,
      );

  TextStyle get litteTextBold => secondaryBold.copyWith(
        fontSize: 12,
      );

  TextStyle get time => secondaryBold.copyWith(
        fontSize: 50,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
