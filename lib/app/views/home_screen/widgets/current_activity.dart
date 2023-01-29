import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/widgets/outlined_card.dart';

class CurrentActivity extends StatefulWidget {
  const CurrentActivity({Key? key}) : super(key: key);

  @override
  State<CurrentActivity> createState() => _CurrentActivityState();
}

class _CurrentActivityState extends State<CurrentActivity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Atividade atual',
                style: TextStyles().titleTertiary,
              ),
            ),
          ],
        ),
        const OutlinedCard(title: 'title', subtitle: 'subtitle'),
      ],
    );
  }
}
