import 'package:flutter/material.dart';
import 'package:minderbrain/Widgets/Quizzs/constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions})
      : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.centerLeft,
      child: Column(children: [
        SizedBox(height: 70.0),
        Text('Question ${indexAction + 1}/$totalQuestions: $question',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
            )),
        SizedBox(
          height: 30,
        )
      ]),
    );
  }
}
