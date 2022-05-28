
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../ReminderTasks/ReminderTask.dart';



class ConfirmPassword extends StatelessWidget {
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        backgroundColor: Colors.white10,
        appBar: AppBar (  
          title: Text("MinderBrain App"),
        ), 
        
        body: SafeArea(  
          child: SingleChildScrollView(child:Column(  
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,

            // ignore: prefer_const_literals_to_create_immutables
            children: [  
              Center (  
                child: Image(image: AssetImage("../images/logo.png")),
              ),

              Center ( 
                child: Text("Confirmer Mot De Passe!", 
                style: TextStyle(fontWeight: FontWeight.bold, color:Colors.blueGrey, fontSize: 22.0),
                )
              ), 

              SizedBox(height: 22.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                  labelText: 'Saisir nouveau mot de passe',
              ),
            )
          ),

          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                  labelText: 'Confirmer mot de passe',
              ),
            )
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
                      MaterialPageRoute(builder: (context) => ReminderTask()),
                    );

                 },
                 child: const Text('Valider', 
                 style: TextStyle(color: Colors.white),

                 ),
            ),
                
          ),

            ], 
          )),
        ),
      ),
    );
  }

}
