import 'package:flutter/material.dart';
import 'package:minderbrain/Widgets/Quizzs/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.option,
    required this.color,
  }) : super(key: key);
  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: color,
        child: ListTile(
          title: Text(option,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                color: Color.fromARGB(255, 0, 0, 0),
              )),
        ));
  }
}
