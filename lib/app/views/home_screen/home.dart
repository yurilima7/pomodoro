import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/widgets/bar.dart';
import 'package:pomodoro/app/core/widgets/outlined_card.dart';
import 'package:pomodoro/app/views/home_screen/widgets/day_activities.dart';
import 'package:pomodoro/app/views/home_screen/widgets/user_data.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
      
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
                            top: constraints.maxHeight * .025,
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
                                      style: TextStyles.i.titleTertiary,
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
      ),
      
      bottomNavigationBar: const Bar(),
    );
  }
}
