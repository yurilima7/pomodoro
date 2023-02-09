import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/activity_controller_impl.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/widgets/main_card.dart';
import 'package:provider/provider.dart';

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
          child: Consumer<ActivityControllerImpl>(
            builder: (context, activity, child) => activity.activities.isNotEmpty
            ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (_, i) => InkWell(
                          onTap: () => Navigator.of(context).pushNamed(
                            '/activity_details.dart',
                            arguments: activity.activities[i],
                          ),
                child: MainCard(
                  title: activity.activities[i].name,
                  subtitle: 'subtitle',
                ),
              ),
            )
            : Center(
                child: Text(
                  'Sem atividades no momento',
                  style: context.textStyles.titleSecondary,
                ),
            ),
          ),
        ),
      ],
    );
  }
}
