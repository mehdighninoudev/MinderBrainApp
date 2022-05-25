
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../ConfirmPassword/ConfirmPassword.dart';

class ForgotPassword extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        backgroundColor: Colors.white10,
        appBar: AppBar(  
          title: Text("MinderBrainApp")
        ),

        body: SafeArea(  
          child: SingleChildScrollView(child: Column(  
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,

            // ignore: prefer_const_literals_to_create_immutables
            children: [ 
              Center(  
                child: Image(image: AssetImage("../images/logo.png")),
              ), 

              Center (  
                child: Text("Mot De Passe Oublie?", 
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 22.0),
                ),
              ), 

               SizedBox( 
                 height: 20,
               ),

                
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                     child: TextFormField(
                     decoration: const InputDecoration(
                     border: UnderlineInputBorder(),
                     labelText: 'Saisir email',
                  ),
               ),
            ),

            Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                 child: ElevatedButton(
                
                 style: ElevatedButton.styleFrom( 
                   fixedSize: Size(500, 50), primary: Colors.blue,
                   
                 ),
                 onPressed: () {
                      Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => ConfirmPassword()),
                    );

                 },
                 child: const Text('Envoyer Email', 
                 style: TextStyle(color: Colors.white),

                 ),
            ),
                
          ),


            ],
          )),
        )
      ),
    );
  }
}