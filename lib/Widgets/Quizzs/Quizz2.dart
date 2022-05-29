import 'package:flutter/material.dart';
import 'package:minderbrain/Widgets/Quizzs/Score.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'Quizz3.dart';

class Quizz2 extends StatefulWidget {
  State<Quizz2> createState() => _Quizz2();
}

enum CheckedQuizz2 { oui, non, oui1, non1 }
CheckedQuizz2 oui = CheckedQuizz2.oui;
CheckedQuizz2 non = CheckedQuizz2.non;
CheckedQuizz2 oui1 = CheckedQuizz2.oui;
CheckedQuizz2 non1 = CheckedQuizz2.non;

var score = CheckedQuizz2.values;
int _score = 0;

class _Quizz2 extends State<Quizz2> {
  CheckedQuizz2? _choix = CheckedQuizz2.oui;
  CheckedQuizz2? _choix1 = CheckedQuizz2.oui1;

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
            children: <Widget>[
              //SizedBox(height: 1.0),
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
                        "Question 1",
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
                      height: 40,
                      child: Text(
                        "Avez-vous du mal à vous rappelez de"
                        " vos taches journaliéres ? ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
             
              // Theme(
              // data: ThemeData(unselectedWidgetColor: Colors.red),

              Column(
                children: [
                  RadioListTile<CheckedQuizz2>(
                    title: Text("Oui"),
                    value: CheckedQuizz2.oui,
                    groupValue: _choix,
                    onChanged: (CheckedQuizz2? value) {
                      setState(() => {
                            _choix = value,
                            print(value.toString()),
                          });
                    },
                    activeColor: Color.fromARGB(255, 13, 135, 227),
                    toggleable: true,
                  ),
                ],

                // ), //child: null,
              ),
              //Text(score.runtimeType)

              RadioListTile<CheckedQuizz2>(
                title: Text("Non"),
                value: CheckedQuizz2.non,
                groupValue: _choix,
                onChanged: (CheckedQuizz2? value) {
                  setState(() => {
                        _choix = value,
                      });
                },
                activeColor: Color.fromARGB(255, 13, 135, 227),
                toggleable: true,
              ),

              SizedBox(
                height: 10,
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
                        "Question 2",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )),
             
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
                        "Avez-vous du mal à vous concentrez lorsque vous regardez la télévision, jouez sur votre téléphone/tablette ou écoutez de la musique ?",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  RadioListTile<CheckedQuizz2>(
                    title: Text("Oui"),
                    value: CheckedQuizz2.oui1,
                    groupValue: _choix1,
                    onChanged: (CheckedQuizz2? value1) {
                      setState(() => {
                            _choix1 = value1!,
                          });
                    },
                    activeColor: Color.fromARGB(255, 13, 135, 227),
                    toggleable: true,
                  ),
                ],

                // ), //child: null,
              ),
              Column(
                children: [
                  RadioListTile<CheckedQuizz2>(
                    title: Text("Non"),
                    value: CheckedQuizz2.non1,
                    groupValue: _choix1,
                    onChanged: (CheckedQuizz2? value1) {
                      setState(() => {
                            _choix1 = value1!,
                          });
                    },
                    activeColor: Color.fromARGB(255, 13, 135, 227),
                    toggleable: true,
                  ),
                ],
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
                      MaterialPageRoute(builder: (context) => Quizz3()),
                    );
                  },
                  child: const Text(
                    'Suivant',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
          )
          ,
        ),
      ),
    );
  }
}
