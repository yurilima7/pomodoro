import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_styles.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';

class OutlinedCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const OutlinedCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsStyles.primary,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: ColorsStyles.secondary,
          width: 3
        ),
      ),

      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyles().cardTitle,
            ),

            subtitle: Text(
              subtitle,
              style: TextStyles().litteText,
            ),

            trailing: Icon(
              Icons.pause_circle,
              color: ColorsStyles.secondary,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}