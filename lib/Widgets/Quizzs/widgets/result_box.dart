import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:minderbrain/Widgets/PatientDashboard/PatientModel.dart';
import 'package:minderbrain/Widgets/Quizzs/constants.dart';
import 'package:minderbrain/Widgets/ReminderTasks/ReminderTask.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {Key? key, required this.result, required this.questionLength})
      : super(key: key);
  final int result;
  final int questionLength;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 0, 82, 149),
      content: Padding(
          padding: EdgeInsets.all(70.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Resultat',
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
              SizedBox(height: 20.0),
              CircleAvatar(
                child: Text(
                  '$result/${questionLength * 10}',
                  style: TextStyle(fontSize: 30.0),
                ),
                radius: 60.0,
                backgroundColor: result == questionLength
                    ? correct
                    : result < questionLength / 2
                        ? incorrect
                        : result == questionLength / 2
                            ? Colors.yellow
                            : Colors.blue,
              ),
              SizedBox(height: 25.0),
              GestureDetector(
                onTap: () async {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return ReminderTask();
                  }));
                },
                child: Center(
                  child: Text(
                    'Admin Dashboard',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
