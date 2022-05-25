
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../ForgotPassword/ForgotPassword.dart';
import '../SignUp/SignUp.dart';
import '../ReminderTasks/ReminderTask.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Redirection extends StatelessWidget {
  
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
          title:  Text("MinderBrain App"),
        ),

        body:  
          SafeArea(   
            child: SingleChildScrollView(child:Column(   
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
                  child: Text("Paitent Ajoute", 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 22.0),
)       
                ),

          Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                 child: ElevatedButton(
                
                 style: ElevatedButton.styleFrom( 
                   fixedSize: Size(500, 50), primary: Colors.blue
                 ),
                 onPressed: () {
                      Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => ReminderTask()),
                    );

                 },
                 
                 child: const Text('Retour vers Admin', 
                 style: TextStyle(color: Colors.white),

                 ),
            ),
                
          ),
              
      ]
          )),
          )
        ),
         
      );
  }
}

