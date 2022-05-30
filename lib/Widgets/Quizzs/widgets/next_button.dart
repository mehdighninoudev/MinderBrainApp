import 'package:flutter/material.dart';
import 'package:minderbrain/Widgets/Quizzs/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.nextQuestion}) : super(key: key);
  final VoidCallback nextQuestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: nextQuestion,
        child: Container(
            // width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(20),
            child: Text(
              "Question Suivante",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )));
  }
}
