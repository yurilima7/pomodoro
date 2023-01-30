import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';

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
              color: ColorsApp.i.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome',
                  style: TextStyles.i.titleSecondary,
                ),
                Text(
                  'Que seu dia seja muito produtivo!',
                  style: TextStyles.i.litteText,
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
            color: ColorsApp.i.white,
          ),
        ),
      ],
    );
  }
}
