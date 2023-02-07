import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/widgets/main_card.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (_, i) => const MainCard(
                title: 'title',
                subtitle: 'subtitle',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
