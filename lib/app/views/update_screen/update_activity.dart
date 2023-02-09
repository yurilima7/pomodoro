import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/activity_controller_impl.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/utils/app_routes.dart';
import 'package:pomodoro/app/core/widgets/options_buttons.dart';
import 'package:pomodoro/app/models/activity.dart';
import 'package:pomodoro/app/views/update_screen/widgets/card_selection.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class UpdateActivity extends StatefulWidget {
  const UpdateActivity({super.key});

  @override
  State<UpdateActivity> createState() => _UpdateActivityState();
}

class _UpdateActivityState extends State<UpdateActivity> {

  final List<String> _timeFocus = [
    '15', '20', '25', '30',
  ];

  final List<String> _pause = [
    '5', '10',
  ];

  final List<String> _interval = [
    '2', '3', '4', '5'
  ];

  String focusValue = '25', pauseValue = '5', intervalValue = '4';
  String nameActivity = '';
  late int id, user;
  final formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final activity = ModalRoute.of(context)!.settings.arguments as Activity;
    focusValue = activity.focusTime;
    pauseValue = activity.breakTime;
    intervalValue = activity.breakActivity;
    debugPrint(intervalValue);
    nameActivity = activity.name;
    id = activity.id!;
    user = activity.idUser;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar',
          style: context.textStyles.titleSecondary,
        ),
        automaticallyImplyLeading: false,
      ),
      
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
                        const Spacer(),
    
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Form(
                              key: formKey,
                              child: TextFormField(
                                initialValue: nameActivity,
                                onSaved: (name) => nameActivity = name ?? '',
                                style: context.textStyles.formText,
                                validator: Validatorless.required('Obrigatório!'),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: context.colors.secondary,
                                  labelText: 'Nome da atividade',
                                ),
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
    
                            Consumer<ActivityControllerImpl>(
                              builder: (context, activity, child) => OptionsButtons(
                                action: () {
                                  activity.deleteActivity(id);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    AppRoutes.authOrHome,
                                    (route) => false,
                                  );
                                },
                                action2: () {
                                  final valid = formKey.currentState?.validate() 
                                    ?? false;
                            
                                  if (valid) {
                                    formKey.currentState?.save();
                                    activity.updateActivity(
                                      nameActivity,
                                      focusValue,
                                      pauseValue,
                                      intervalValue,
                                      id,
                                    );
                                    Navigator.of(context).pop(
                                      Activity(
                                        idUser: user,
                                        name: nameActivity,
                                        focusTime: focusValue,
                                        breakTime: pauseValue,
                                        breakActivity: intervalValue,
                                        id: id,
                                      ),
                                    );
                                  }
                                },
                                title: 'Deletar',
                                title2: 'Salvar',
                              ),
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
      ),
    );
  }
}
