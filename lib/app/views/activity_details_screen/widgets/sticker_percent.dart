import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';

class StickerPercent extends StatelessWidget {
  final int time;

  const StickerPercent({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          height: 300,

          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),

          child: Center(
            child: Text(
              '$time:30',
              style: context.textStyles.time,
            ),
          ),
        ),

        SizedBox(
          width: 300,
          height: 300,

          child: CircularProgressIndicator(
            value: 5 / 10.0,
            color: context.colors.secondary,
            strokeWidth: 40,
            backgroundColor: context.colors.tertiary,
          ),
        )
      ],
    );
  }
}
