import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';
import 'package:pomodoro/app/core/widgets/options_buttons.dart';
import 'package:pomodoro/app/views/add_screen/widgets/card_selection.dart';
class AddActivity extends StatefulWidget {
  const AddActivity({super.key});

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {

  final List<String> _timeFocus = [
    '15', '20', '25', '30',
  ];

  final List<String> _pause = [
    '5', '10',
  ];

  final List<String> _interval = [
    '2', '3', '4'
  ];

  String focusValue = '25', pauseValue = '5', intervalValue = '4';

  @override
  Widget build(BuildContext context) {

    return SafeArea(
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
                      const Spacer(),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: context.colors.secondary,
                              labelText: 'Nome da atividade',
                            ),
                          ),
                          
                          const SizedBox(
                            height: 35,
                          ),

                          CardSelection(
                            value: focusValue,
                            opts: _timeFocus,
                            title: 'Tempo de foco',
                            selection: (String? value) {
                              setState(() {
                                focusValue = value!;
                              });
                            },
                          ),

                          CardSelection(
                            value: pauseValue,
                            opts: _pause,
                            title: 'Tempo de pausa',
                            selection: (String? value) {
                              setState(() {
                                pauseValue = value!;
                              });
                            },
                          ),

                          CardSelection(
                            title: 'Intervalos',
                            value: intervalValue,
                            opts: _interval,
                            selection: (String? value) {
                              setState(() {
                                intervalValue = value!;
                              });
                            },
                          ),

                          const SizedBox(
                             height: 140,
                          ),

                          OptionsButtons(
                            action: () {},
                            action2: () {},
                            title: 'Cancelar',
                            title2: 'Salvar',
                          ),
                        ],
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
