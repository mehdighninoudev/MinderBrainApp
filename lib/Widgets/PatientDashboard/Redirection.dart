import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:minderbrain/Widgets/PatientDashboard/PatientDashboard.dart';
import 'package:minderbrain/Widgets/VoirTaches/TaskModel.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../ForgotPassword/ForgotPassword.dart';
import '../SignUp/SignUp.dart';
import '../ReminderTasks/ReminderTask.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RedirectionPatient extends StatefulWidget {
  final TaskModel task;
  const RedirectionPatient({Key? key, required this.task}) : super(key: key);

  @override
  State<RedirectionPatient> createState() => _RedirectionPatient();
}

class _RedirectionPatient extends State<RedirectionPatient> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("MinderBrain App"),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Center(
                  child: Image(image: AssetImage("../images/logo.png")),
                ),*/

                  Center(
                    child: Image.asset('images/logo.png'),
                    //child: Image(image: AssetImage("../images/logo.png")),
                  ),
                  SizedBox(height: 60),
                  Center(
                      child: Text(
                    "Confirmation Validation",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        fontSize: 22.0),
                  )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(500, 50), primary: Colors.blue),
                      onPressed: () {
                        UpdateCompleted();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientDashboard()),
                        );
                      },
                      child: const Text(
                        'Valider',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ]),
          ))),
    );
  }

  void UpdateCompleted() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseReference taskRef = FirebaseDatabase.instance
          .reference()
          .child("tasks")
          .child(user.uid)
          .child(widget.task.taskId);
      taskRef.update({'completed': "1"});
    }
  }
}
