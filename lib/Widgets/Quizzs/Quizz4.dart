import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'Quizz5.dart';

class Quizz4 extends StatefulWidget {
  State<Quizz4> createState() => _Quizz4();
}

enum CheckedQuizz4 { oui, non }
CheckedQuizz4 oui = CheckedQuizz4.oui;
CheckedQuizz4 non = CheckedQuizz4.non;

class _Quizz4 extends State<Quizz4> {
  CheckedQuizz4 _choix = CheckedQuizz4.oui;
  CheckedQuizz4 _choix1 = CheckedQuizz4.oui;
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
                        "Question 5",
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
                      height: 70,
                      child: Text(
                        "Avez-vous besoin d'aide pour vous habiller, vous souvenir de prendre vos médicaments et/ou gérer vos finances ? ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              
              Column(
                children: [
                  RadioListTile<CheckedQuizz4>(
                    title: Text("Oui"),
                    value: CheckedQuizz4.oui,
                    groupValue: _choix,
                    onChanged: (CheckedQuizz4? value) {
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
              RadioListTile<CheckedQuizz4>(
                title: Text("Non"),
                value: CheckedQuizz4.non,
                groupValue: _choix,
                onChanged: (CheckedQuizz4? value) {
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
                        "Question 6",
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
                        "Ces difficultés reflètent-elles des changements par rapport à votre façon de se souvenir il y a quelques années ?",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              
              Column(
                children: [
                  RadioListTile<CheckedQuizz4>(
                    title: Text("Oui"),
                    value: CheckedQuizz4.oui,
                    groupValue: _choix1,
                    onChanged: (CheckedQuizz4? value) {
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
              RadioListTile<CheckedQuizz4>(
                title: Text("Non"),
                value: CheckedQuizz4.non,
                groupValue: _choix1,
                onChanged: (CheckedQuizz4? value) {
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
                      MaterialPageRoute(builder: (context) => Quizz5()),
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
