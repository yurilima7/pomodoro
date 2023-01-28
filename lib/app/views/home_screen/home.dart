import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_styles.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/widgets/main_card.dart';
import 'package:pomodoro/app/core/widgets/outlined_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_circle_outlined,
                                    size: 50,
                                    color: ColorsStyles.white,
                                  ),

                                  const SizedBox(width: 5,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nome',
                                        style: TextStyles().titleSecondary,
                                      ),
                                      Text(
                                        'Que seu dia seja muito produtivo!',
                                        style: TextStyles().litteText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert, size: 32, color: ColorsStyles.white,),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(bottom: constraints.maxHeight * .06),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                
                                children: [
                                  Text(
                                    'Atividade atual',
                                    style: TextStyles().titleTertiary,
                                  ),
                                  Text(
                                    'Ver todas',
                                    style: TextStyles().litteTextBold,
                                  ),
                                ],
                              ),

                              const OutlinedCard(title: 'title', subtitle: 'subtitle'),
                            ],
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Atividades do dia',
                              style: TextStyles().titleTertiary,
                            ),

                            SizedBox(
                              height: 320,
                              child: ListView.builder(
                                physics:const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (_, i) => const MainCard(
                                  title: 'title',
                                  subtitle: 'subtitle',
                                ),
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