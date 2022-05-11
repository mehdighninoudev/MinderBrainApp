
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../Quizzs/Quizz.dart';
import '../Login/Login.dart';


class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // ignore: prefer_const_constructors
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: Scaffold( 
        backgroundColor: Colors.white10, 
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
                  child: Image(image: AssetImage("../images/logo.png")),
                ),

                Center(
                  child: Text("Inscription", 
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
                     labelText: 'Choisir username',
                  ),
               ),
            ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                     child: TextFormField(
                     decoration: const InputDecoration(
                     border: UnderlineInputBorder(),
                     labelText: 'Entrer email',
                  ),
               ),
            ),

             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                  labelText: 'Choisir mot de passe',
              ),
            )
          ), 

          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                  labelText: 'Repeter mot de passe',
              ),
            )
          ),

            SizedBox( 
                height: 20,
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
                    MaterialPageRoute(builder: (context) =>  Quizz()),
                  );
                 },
                 child: const Text('Inscription', 
                 style: TextStyle(color: Colors.white),

                 ),
            ),
                
          ),

          SizedBox(height: 12.0),

          Container(  
            child: TextButton(  
                child: Text("Deja membre? Identifiez-vous!"),
                onPressed: () {
                  // Navigate to sign up page
                  Navigator.push(  
                    context, 
                    MaterialPageRoute(builder: (context) =>  Login()),
                  );
                }
              )

            )
          
          
              ]
          ),
          )
        ),
        
      );
  }
}