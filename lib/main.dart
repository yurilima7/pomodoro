import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro/app/pomodoro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const Pomodoro());
}