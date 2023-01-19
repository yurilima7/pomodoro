import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/theme/theme_settings.dart';
import 'package:pomodoro/app/core/utils/app_routes.dart';
import 'package:pomodoro/app/views/login_screen/login.dart';
import 'package:pomodoro/app/views/start_screen/start.dart';

 GlobalKey <NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
 GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey 
  = GlobalKey<ScaffoldMessengerState>();

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeSettings.theme,
      debugShowCheckedModeBanner: false,

      routes: {
        AppRoutes.startScreen:(context) => const Start(),
        AppRoutes.loginScreen:(context) => const Login(),
      },
    );
  }
}