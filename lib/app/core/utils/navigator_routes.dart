import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/utils/app_routes.dart';
import 'package:pomodoro/app/pomodoro.dart';

class NavigatorRoutes {
  void loginScreen() {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
      (route) => false,
    );
  }

  void registerScreen() {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.registerScreen,
      (route) => false,
    );
  }

  void homeScreen() {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.homeScreen,
      (route) => false,
    );
  }
}
