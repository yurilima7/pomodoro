import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/widgets/bar.dart';
import 'package:pomodoro/app/views/home_screen/widgets/current_activity.dart';
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
                          child: const CurrentActivity(),
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
