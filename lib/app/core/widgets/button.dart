import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/button_styles.dart';

class Button extends StatelessWidget {
  final Function() action;
  final String title;

  const Button({super.key, required this.action, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: context.buttons.button,
      onPressed: action,
      child: Text(title),
    );
  }
}
