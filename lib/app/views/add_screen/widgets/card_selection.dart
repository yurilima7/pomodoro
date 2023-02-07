import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/colors_app.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';

class CardSelection extends StatelessWidget {
  final String title;
  final String value; 
  final List<String> opts;
  final Function(String?) selection;

  const CardSelection({
    super.key,
    required this.value,
    required this.opts,
    required this.title,
    required this.selection,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textStyles.cardTitle,
              ),

              DropdownButton(
                value: value,
                style: context.textStyles.cardTitle,
                elevation: 2,
                underline: Container(
                  color: context.colors.secondary,
                ),
                dropdownColor: context.colors.secondary,
                iconEnabledColor: context.colors.white,
                borderRadius: BorderRadius.circular(20),
                items: opts.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: selection,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
