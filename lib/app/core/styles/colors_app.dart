import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFF0C1139);
  Color get secondary => const Color(0xFF0E4C9D);
  Color get tertiary => const Color(0xFF25A0D8);
  Color get white => Colors.white;
  Color get error => Colors.redAccent;
  Color get sucess => Colors.greenAccent;
  Color get select => Colors.white10;
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
