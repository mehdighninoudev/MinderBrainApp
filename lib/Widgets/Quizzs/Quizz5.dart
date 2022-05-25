import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../ReminderTasks/ReminderTask.dart';

class Quizz5 extends StatefulWidget {
  State<Quizz5> createState() => _Quizz5();
}

enum CheckedQuizz5 { oui, non }
CheckedQuizz5 oui = CheckedQuizz5.oui;
CheckedQuizz5 non = CheckedQuizz5.non;

class _Quizz5 extends State<Quizz5> {
  CheckedQuizz5 _choix = CheckedQuizz5.oui;
  CheckedQuizz5 _choix1 = CheckedQuizz5.oui;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("MinderBrain App"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(child: Column(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orangeAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Center(
                    child: Container(
                      child: Text(
                        "Question 7",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.send,
                    color: Colors.amber,
                    size: 15,
                    semanticLabel: 'Question',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Container(
                      width: 310,
                      height: 80,
                      child: Text(
                        "Vous confondez-vous avec le rappel du jour de la semaine, du mois, de l'année, des dates importantes et/ou des rendez-vous ?",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              
              Column(
                children: [
                  RadioListTile<CheckedQuizz5>(
                    title: Text("Oui"),
                    value: CheckedQuizz5.oui,
                    groupValue: _choix,
                    onChanged: (CheckedQuizz5? value) {
                      setState(() => {
                            _choix = value!,
                          });
                    },
                    activeColor: Color.fromARGB(255, 13, 135, 227),
                    toggleable: true,
                  ),
                ],

                // ), //child: null,
              ),
              RadioListTile<CheckedQuizz5>(
                title: Text("Non"),
                value: CheckedQuizz5.non,
                groupValue: _choix,
                onChanged: (CheckedQuizz5? value) {
                  setState(() => {
                        _choix = value!,
                      });
                },
                activeColor: Color.fromARGB(255, 13, 135, 227),
                toggleable: true,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orangeAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Center(
                    child: Container(
                      child: Text(
                        "Question 8",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.send,
                    color: Colors.amber,
                    size: 15,
                    semanticLabel: 'Question',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Container(
                      width: 310,
                      height: 80,
                      child: Text(
                        "Trouvez vous que vous comprenez pas ce que les autres disent, à rire à des moments inappropriés ?",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              
              Column(
                children: [
                  RadioListTile<CheckedQuizz5>(
                    title: Text("Oui"),
                    value: CheckedQuizz5.oui,
                    groupValue: _choix1,
                    onChanged: (CheckedQuizz5? value) {
                      setState(() => {
                            _choix1 = value!,
                          });
                    },
                    activeColor: Color.fromARGB(255, 13, 135, 227),
                    toggleable: true,
                  ),
                ],

                // ), //child: null,
              ),
              RadioListTile<CheckedQuizz5>(
                title: Text("Non"),
                value: CheckedQuizz5.non,
                groupValue: _choix1,
                onChanged: (CheckedQuizz5? value) {
                  setState(() => {
                        _choix1 = value!,
                      });
                },
                activeColor: Color.fromARGB(255, 13, 135, 227),
                toggleable: true,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(500, 50),
                    primary: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReminderTask()),
                    );
                  },
                  child: const Text(
                    'Page Admin',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
          ,)
           ,
        ),
      ),
    );
  }
}
