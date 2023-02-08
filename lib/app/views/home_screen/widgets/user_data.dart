import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/user_controller_impl.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:provider/provider.dart';

class UserData extends StatefulWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.account_circle_outlined,
              size: 50,
              color: context.colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<UserControllerImpl>(
                  builder: (context, user, child) => Text(
                    'Olá, ${user.user}',
                    style: context.textStyles.titleSecondary,
                  ),
                ),
                Text(
                  'Que seu dia seja muito produtivo!',
                  style: context.textStyles.litteText,
                ),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.more_vert,
            size: 32,
            color: context.colors.white,
          ),
        ),
      ],
    );
  }
}
