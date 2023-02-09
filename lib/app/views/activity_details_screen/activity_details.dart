import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/utils/app_routes.dart';
import 'package:pomodoro/app/core/widgets/main_card.dart';
import 'package:pomodoro/app/core/widgets/options_buttons.dart';
import 'package:pomodoro/app/models/activity.dart';

class ActivityDetails extends StatefulWidget {
  const ActivityDetails({super.key});

  @override
  State<ActivityDetails> createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  double percentage = 100;
  int seconds = 0, index = 1;
  late int timeMinute, minutes, timeSecond, breakPause, interval, cicles;
  bool isPause = false;
  Timer? timer;
  late String activityName;
  late Activity activity;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    activity = ModalRoute.of(context)!.settings.arguments as Activity;
    activityName = activity.name;
    breakPause = int.parse(activity.breakTime);
    timeMinute = int.parse(activity.focusTime);
    interval = int.parse(activity.breakActivity);
    cicles = int.parse(activity.breakActivity);
    minutes = int.parse(activity.focusTime);
    timeSecond = timeMinute * 60;
  }


  void timeInit() {
    double time = minutes * 60;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (timeMinute > 0 && seconds == 0) {
            timeMinute--;
            timeSecond--;
            seconds = 59;
            percentage = (100 * timeSecond) / time;
          } else if (timeMinute > 0 && seconds > 0) {
            timeSecond--;
            seconds--;
            percentage = (100 * timeSecond) / time;
          } else if (timeMinute == 0 && seconds > 0) {
            timeSecond--;
            seconds--;
            percentage = (100 * timeSecond) / time;
          } else {
            if (!isPause && interval != 0) {
              seconds = 0;
              percentage = 100;
              timeMinute = breakPause;
              timeSecond = timeMinute * 60;
              minutes = breakPause;
              interval--;
              isPause = true;
            } else if (isPause && interval != 0) {
              seconds = 0;
              percentage = 100;
              timeMinute = int.parse(activity.focusTime);
              timeSecond = timeMinute * 60;
              minutes = int.parse(activity.focusTime);
              interval--;
              index++;
              isPause = false;
            } else {
              breakPause = int.parse(activity.breakTime);
              timeMinute = int.parse(activity.focusTime);
              interval = int.parse(activity.breakActivity);
              minutes = int.parse(activity.focusTime);
              index = 1;
              timeSecond = timeMinute * 60;
              isPause = false;
              timer.cancel();
            }
          }
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          activityName,
          style: context.textStyles.titleSecondary,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                activity = await Navigator.of(context).pushNamed(
                    AppRoutes.updateActivityScreen,
                    arguments: activity,
                  ) as Activity;

                setState(() {
                    activityName = activity.name;
                    breakPause = int.parse(activity.breakTime);
                    timeMinute = int.parse(activity.focusTime);
                    interval = int.parse(activity.breakActivity);
                    cicles = int.parse(activity.breakActivity);
                    minutes = int.parse(activity.focusTime);
                    timeSecond = timeMinute * 60;
                });
              },
              icon: const Icon(Icons.edit)),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (_, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainCard(
                        title: 'Ciclo $index/$cicles',
                        subtitle: '$minutes minutos',
                      ),
                      CircularPercentIndicator(
                        radius: 150.0,
                        percent: (100 - percentage) / 100,
                        animation: true,
                        animateFromLastPercent: true,
                        lineWidth: 40.0,
                        progressColor: isPause? context.colors.error : context.colors.tertiary,
                        backgroundColor: context.colors.secondary,
                        center: Text(
                          seconds < 10
                              ? '$timeMinute:0$seconds'
                              : '$timeMinute:$seconds',
                          style: context.textStyles.time,
                        ),
                      ),
                      OptionsButtons(
                        title: 'Iniciar',
                        title2: 'Pausar',
                        action: () => timeInit(),
                        action2: () {
                          timer?.cancel();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
