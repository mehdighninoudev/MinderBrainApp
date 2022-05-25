import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'Quizz2.dart';

class Quizz extends StatefulWidget {
  State<Quizz> createState() => _Quizz();
}

enum CheckedQuizz { oui, non }
CheckedQuizz oui = CheckedQuizz.oui;
CheckedQuizz non = CheckedQuizz.non;

class _Quizz extends State<Quizz> {
  bool isChecked = false;
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
             /* Center(
                child: Image(image: AssetImage("../images/logo.png")),
              ),*/
              SizedBox(
                height: 100,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 100,
                      child: const Text(
                        "      Veuillez repondre au quizz !",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(500, 50),
                      primary: Color.fromARGB(255, 0, 255, 195),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Quizz2()),
                      );
                    },
                    child: const Text(
                      'Démarrer',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          )
          ,)
          
          
        ),
      ),
    );
  }
}
