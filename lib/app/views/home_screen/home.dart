import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/widgets/outlined_card.dart';
import 'package:pomodoro/app/views/home_screen/widgets/day_activities.dart';
import 'package:pomodoro/app/views/home_screen/widgets/user_data.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
    
        child: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
    
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(               
                          bottom: constraints.maxHeight * .06,
                        ),
                        
                        child: const UserData(),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: constraints.maxHeight * .06),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Atividade atual',
                                    style: context.textStyles.titleTertiary,
                                  ),
                                ),
                              ],
                            ),
                            const OutlinedCard(title: 'title', subtitle: 'subtitle'),
                          ],
                        ),
                      ),

                      const DayActivities(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
