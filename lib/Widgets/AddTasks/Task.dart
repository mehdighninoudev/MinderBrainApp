
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minderbrain/Widgets/AddPatient/redirection.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../ForgotPassword/ForgotPassword.dart';
import '../SignUp/SignUp.dart';
import '../ReminderTasks/ReminderTask.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'redirection.dart';
import 'package:firebase_core/firebase_core.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTask();
}

class _AddTask extends State<AddTask> {
  
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  var TaskController = TextEditingController();

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
                  child: Text("Ajouter Tache", 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 22.0),
)
                ),

                SizedBox( 
                 height: 20,
               ),

                
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                     child: TextFormField(
                       controller: TaskController,
                     decoration: const InputDecoration(
                     border: UnderlineInputBorder(),
                     labelText: 'Saisir tache',
                  ),

                  /*onChanged: (value) {
                    nomTache = value;
                  },*/
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
                 onPressed: () async {
                     
                    String taskName = TaskController.text.trim();

                    if(taskName.isEmpty) {
                      Fluttertoast.showToast(msg: 'Merci de saisir une tache');
                      return;
                    }

                    User? user = FirebaseAuth.instance.currentUser;

                    if(user != null) {
                      String uid = user.uid;
                      int dt = DateTime.now().millisecondsSinceEpoch;

                      DatabaseReference taskRef = FirebaseDatabase.instance.reference().child('tasks').child(uid);

                      String taskId = taskRef.push().key!;
                      await taskRef.child(taskId).set({
                        'dt':dt,
                        "taskName":taskName,
                        'taskId':taskId,
                        'completed': 0

                      });

                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return Redirection();
                        }));


                    }
                    /*Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => RedirectionTache()),
                    );*/
                                    
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

