
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minderbrain/Widgets/AddPatient/redirection.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../ForgotPassword/ForgotPassword.dart';
import '../SignUp/SignUp.dart';
import '../ReminderTasks/ReminderTask.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AddPatient extends StatelessWidget {
  
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  String nomPatient = '';

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
            child: Column(   
              verticalDirection: VerticalDirection.down, 
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Center(
                  child: Image.asset('images/logo.png'),
                  //child: Image(image: AssetImage("../images/logo.png")),
                ),
                
                /*Center(
                  child: Image(image: AssetImage("../images/logo.png")),
                ),*/

                Center(
                  child: Text("Ajouter Patient", 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 22.0),
)
                ),

                SizedBox( 
                 height: 20,
               ),

                
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                     child: TextFormField(
                     decoration: const InputDecoration(
                     border: UnderlineInputBorder(),
                     labelText: 'Saisir nom patient',
                  ),

                  onChanged: (value) {
                    nomPatient = value;
                  },
               ),
            ),

            

            SizedBox( 
                height: 20,
            ),

           

            /*Container(  
            child: Center(  
                child: TextButton(  
                child: Text("J'ai oublie mon mot de passe"),
                onPressed: () {
                  Navigator.push(  
                    context, 
                    MaterialPageRoute(builder: (context) =>  ForgotPassword()),
                  );
                  // Navigate to sign up page
                }
              )
            )
            

            ),*/
            
  
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                 child: ElevatedButton(
                
                 style: ElevatedButton.styleFrom( 
                   fixedSize: Size(500, 50), primary: Colors.blue
                 ),
                 /*onPressed: () {
                      Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => ReminderTask()),
                    );

                 },*/
                 onPressed: () {
                     
                    Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => Redirection()),
                    );
                                    
                 },
                 child: const Text('Ajouter', 
                 style: TextStyle(color: Colors.white),

                 ),
            ),
                
          ),
          
              ]
          ),
          )
        ),
         
      );
  }
}

