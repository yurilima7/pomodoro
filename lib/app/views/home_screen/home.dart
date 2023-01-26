import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/user_controller_impl.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserControllerImpl>(
        builder: (context, user, child) => Center(
          child: Text(user.userName),
        ),
      ),
    );
  }
}