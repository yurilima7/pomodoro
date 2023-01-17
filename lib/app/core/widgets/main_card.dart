import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';

class MainCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const MainCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
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
          ),
        ],
      ),
    );
  }
}
