import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';

class OutlinedCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const OutlinedCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.i.primary,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: ColorsApp.i.secondary,
          width: 3
        ),
      ),

      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyles.i.cardTitle,
            ),

            subtitle: Text(
              subtitle,
              style: TextStyles.i.litteText,
            ),

            trailing: Icon(
              Icons.pause_circle,
              color: ColorsApp.i.secondary,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}