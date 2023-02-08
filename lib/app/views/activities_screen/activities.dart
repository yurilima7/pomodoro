import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/activity_controller_impl.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/widgets/main_card.dart';
import 'package:provider/provider.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<ActivityControllerImpl>(
            builder: (context, activity, child) => activity.activities.isNotEmpty
            ? Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: activity.activities.length,
                  itemBuilder: (_, i) => InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/activity_details.dart'),
                    child: MainCard(
                      title: activity.activities[i].name,
                      subtitle: 'subtitle',
                    ),
                  ),
                ),
              ],
            ) : Center(
              child: Text(
                  'Sem atividades no momento',
                  style: context.textStyles.titleSecondary,
                ),
            ),
          ),
        ),
      ),
    );
  }
}
