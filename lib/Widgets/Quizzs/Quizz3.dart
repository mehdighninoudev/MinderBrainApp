import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'Quizz4.dart';

class Quizz3 extends StatefulWidget {
  State<Quizz3> createState() => _Quizz3();
}

enum CheckedQuizz3 { oui, non, oui1, non1 }
CheckedQuizz3 oui = CheckedQuizz3.oui;
CheckedQuizz3 non = CheckedQuizz3.non;
CheckedQuizz3 oui1 = CheckedQuizz3.oui;
CheckedQuizz3 non1 = CheckedQuizz3.non;

class _Quizz3 extends State<Quizz3> {
  CheckedQuizz3 _choix = CheckedQuizz3.oui;
  CheckedQuizz3 _choix1 = CheckedQuizz3.oui1;
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
                        "Question 3",
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
                        "Oubliez-vous les noms d'objets familiers et utilisez-vous des expressions générales telles que « tu vois ce que je veux dire » ou « cette chose » ? ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              
              Column(
                children: [
                  RadioListTile<CheckedQuizz3>(
                    title: Text("Oui"),
                    value: CheckedQuizz3.oui1,
                    groupValue: _choix1,
                    onChanged: (CheckedQuizz3? val) {
                      setState(() => {
                            _choix1 = val!,
                          });
                    },
                    activeColor: Color.fromARGB(255, 13, 135, 227),
                    toggleable: true,
                  ),
                ],

                // ), //child: null,
              ),
              RadioListTile<CheckedQuizz3>(
                title: Text("Non"),
                value: CheckedQuizz3.non1,
                groupValue: _choix1,
                onChanged: (CheckedQuizz3? value) {
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
                        "Question 4",
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
                        "Êtes-vous facilement confus en conduisant ou en utilisant des outils ? Vous perdez-vous dans des endroits qui vous sont familiers ?",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            
              Column(
                children: [
                  RadioListTile<CheckedQuizz3>(
                    title: Text("Oui"),
                    value: CheckedQuizz3.oui,
                    groupValue: _choix,
                    onChanged: (CheckedQuizz3? value) {
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
              RadioListTile<CheckedQuizz3>(
                title: Text("Non"),
                value: CheckedQuizz3.non,
                groupValue: _choix,
                onChanged: (CheckedQuizz3? value) {
                  setState(() => {
                        _choix = value!,
                      });
                },
                activeColor: Color.fromARGB(255, 13, 135, 227),
                toggleable: true,
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
                      MaterialPageRoute(builder: (context) => Quizz4()),
                    );
                  },
                  child: const Text(
                    'Suivant',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),)
          
          ,
        ),
      ),
    );
  }
}
