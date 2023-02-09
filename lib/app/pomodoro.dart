import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/activity_controller_impl.dart';
import 'package:pomodoro/app/controller/user_controller_impl.dart';
import 'package:pomodoro/app/core/theme/theme_settings.dart';
import 'package:pomodoro/app/core/utils/app_routes.dart';
import 'package:pomodoro/app/views/activity_details_screen/activity_details.dart';
import 'package:pomodoro/app/views/auth_or_home/auth_or_home.dart';
import 'package:pomodoro/app/views/login_screen/login.dart';
import 'package:pomodoro/app/views/register_screen/register.dart';
import 'package:pomodoro/app/views/start_screen/start.dart';
import 'package:pomodoro/app/views/update_screen/update_activity.dart';
import 'package:provider/provider.dart';

 GlobalKey <NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
 GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey 
  = GlobalKey<ScaffoldMessengerState>();

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserControllerImpl(),
        ),

        ChangeNotifierProvider(
          create: (_) => ActivityControllerImpl(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        theme: ThemeSettings.theme,
        debugShowCheckedModeBanner: false,
      
        routes: {
          AppRoutes.authOrHome:(context) => const AuthOrHome(),
          AppRoutes.startScreen:(context) => const Start(),
          AppRoutes.loginScreen:(context) => const Login(),
          AppRoutes.registerScreen:(context) => const Register(),
          AppRoutes.activityDetailsScreen:(context) => const ActivityDetails(),
          AppRoutes.updateActivityScreen:(context) => const UpdateActivity(),
        },
      ),
    );
  }
}