import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/widgets/main_card.dart';
import 'package:pomodoro/app/core/widgets/options_buttons.dart';
import 'package:pomodoro/app/views/activity_details_screen/widgets/sticker_percent.dart';

class ActivityDetails extends StatefulWidget {
  const ActivityDetails({super.key});

  @override
  State<ActivityDetails> createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
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
                      const MainCard(
                        title: 'Ciclo 1/4',
                        subtitle: '25 minutos',
                      ),

                      const StickerPercent(time: 12),

                      OptionsButtons(
                        title: 'Parar',
                        title2: 'Pausar',
                        action: () {},
                        action2: () {},
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
