import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/button_styles.dart';

class OptionsButtons extends StatelessWidget {
  final String title;
  final String title2;
  final Function() action;
  final Function() action2;

  const OptionsButtons({
    super.key,
    required this.title,
    required this.title2, 
    required this.action, 
    required this.action2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyles().optButtonCancel,
            onPressed: () {},

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
          ),
        ),

        Expanded(
          child: ElevatedButton(
            style: ButtonStyles().optButton,
            onPressed: () {},
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
          ),
        ),
      ],
    );
  }
}
