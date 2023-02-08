import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/widgets/main_card.dart';
import 'package:pomodoro/app/core/widgets/options_buttons.dart';

class ActivityDetails extends StatefulWidget {
  const ActivityDetails({super.key});

  @override
  State<ActivityDetails> createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  double percentage = 100;
  int seconds = 0;
  late int timeMinute, minutes;
  late int timeSecond;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    debugPrint("teste");
    timeMinute = 25;
    minutes = 25;
    timeSecond = timeMinute * 60;
  }
  
  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void timeInit() {
    double time = 25 * 60;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeMinute > 0 && seconds == 0) {
          debugPrint(percentage.toString());
          timeMinute--;
          timeSecond--;
          seconds = 59;
          percentage = (100 * timeSecond) / time;
        }
        else if (timeMinute > 0 && seconds > 0) {
          debugPrint(percentage.toString());
          timeSecond--;
          seconds--;
          percentage = (100 * timeSecond) / time;
        }
        else if (timeMinute == 0 && seconds > 0) {
          debugPrint(percentage.toString());
          timeSecond--;
          seconds--;
          percentage = (100 * timeSecond) / time;
        }
        else {
          seconds = 0;
          percentage = 0;
          timeSecond = 0;
          timeMinute = 0;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nome da atividade',
          style: context.textStyles.titleSecondary,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
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
                        title: 'Ciclo 1/4',
                        subtitle: '$minutes minutos',
                      ),

                      CircularPercentIndicator(
                        radius: 150.0,
                        percent: (100 - percentage) / 100,
                        animation: true,
                        animateFromLastPercent: true,
                        lineWidth: 40.0,
                        progressColor: context.colors.tertiary,
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
                        action2: () {timer.cancel();},
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