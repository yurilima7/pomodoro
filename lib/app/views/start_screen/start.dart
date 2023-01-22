import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/utils/navigator_routes.dart';
import 'package:pomodoro/app/core/widgets/button.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  final List<String> images = [
    'assets/images/reading.svg',
    'assets/images/working.svg',
    'assets/images/sporting.svg',
  ];

  final List<String> titles = [
    'Planeje seus momentos de estudos',
    'Organize sua rotina de trabalho',
    'Tenha mais momentos para você'
  ];

  final List<String> buttonTitles = [
    'Continuar',
    'Continuar',
    'Iniciar',
  ];

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 30.0,
          bottom: 30.0,
        ),

        child: LayoutBuilder(
          builder: (context, constraint) {
            
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),

                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      Text(
                        titles[i],
                        style: TextStyles().title,
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: constraint.maxHeight * .1),
                
                      SvgPicture.asset(
                        images[i],
                        width: constraint.maxWidth * .9,
                        fit: BoxFit.contain,
                      ),
                
                      SizedBox(height: constraint.maxHeight * .1),

                      Button(
                        action: i < 2 ? () {
                          setState(() {
                            i += 1;
                          });
                        }
                        :() => NavigatorRoutes().loginScreen(),
                        title: buttonTitles[i],
                      ),
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
