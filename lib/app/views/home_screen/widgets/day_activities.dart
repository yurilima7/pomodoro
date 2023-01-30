import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/widgets/main_card.dart';

class DayActivities extends StatefulWidget {
  const DayActivities({Key? key}) : super(key: key);

  @override
  State<DayActivities> createState() => _DayActivitiesState();
}

class _DayActivitiesState extends State<DayActivities> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Atividades do dia',
                style: context.textStyles.titleTertiary,
              ),
              InkWell(
                onTap: (){},
                child: Text(
                  'Ver todas',
                  style: context.textStyles.litteTextBold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (_, i) => const MainCard(
              title: 'title',
              subtitle: 'subtitle',
            ),
          ),
        ),
      ],
    );
  }
}
