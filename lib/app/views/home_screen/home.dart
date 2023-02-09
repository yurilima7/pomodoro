import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/activity_controller_impl.dart';
import 'package:pomodoro/app/views/home_screen/widgets/day_activities.dart';
import 'package:pomodoro/app/views/home_screen/widgets/user_data.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<ActivityControllerImpl>(context, listen: false).loadActivity();
  }

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
                          bottom: constraints.maxHeight * .10,
                        ),
                        
                        child: const UserData(),
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
