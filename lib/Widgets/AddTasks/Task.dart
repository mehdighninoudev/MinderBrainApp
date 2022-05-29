import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minderbrain/Widgets/AddTasks/redirection.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../ForgotPassword/ForgotPassword.dart';
import '../SignUp/SignUp.dart';
import '../ReminderTasks/ReminderTask.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
          backgroundColor: Color.fromARGB(255, 160, 194, 225),
          appBar: AppBar(
            title: Text("                          Page Tasks"),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(204, 232, 234, 235),
                  Color.fromARGB(204, 232, 234, 235),
                  Color.fromARGB(204, 232, 234, 235),
                  Color.fromARGB(204, 232, 234, 235),
                ])),
            child: SingleChildScrollView(
                child: Column(
                    verticalDirection: VerticalDirection.down,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 150,
                    child: Center(
                      child: Image.asset('images/loog2.png'),
                      //child: Image(image: AssetImage("../images/logo.png")),
                    ),
                  ),
                  SizedBox(height: 30),
                  /*Center(
                  child: Image(image: AssetImage("../images/logo.png")),
                ),*/

                  Center(
                      child: Text(
                    "Ajouter Tache",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        fontSize: 22.0),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200]?.withOpacity(0.5),
                          border: Border.all(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          controller: TaskController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Saisir la tache',
                          ),

                          /*onChanged: (value) {
                        nomTache = value;
                  },*/
                        ),
                      ),
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
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(12)),
                              fixedSize: Size(500, 50),
                              primary: Colors.blue),
                          /*onPressed: () {
                          Navigator.push(   
                          context,
                          MaterialPageRoute(builder: (context) => ReminderTask()),
                        );

                 },*/
                          onPressed: () async {
                            String taskName = TaskController.text.trim();

                            if (taskName.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Merci de saisir une tache');
                              return;
                            }

                            User? user = FirebaseAuth.instance.currentUser;

                            if (user != null) {
                              String uid = user.uid;
                              int dt = DateTime.now().millisecondsSinceEpoch;

                              DatabaseReference taskRef = FirebaseDatabase
                                  .instance
                                  .reference()
                                  .child('tasks')
                                  .child(uid);

                              String taskId = taskRef.push().key!;
                              await taskRef.child(taskId).set({
                                'dt': dt,
                                "taskName": taskName,
                                'taskId': taskId,
                                'completed': 0
                              });

                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return RedirectionTache();
                              }));
                            }
                            /*Navigator.push(   
                          context,
                          MaterialPageRoute(builder: (context) => RedirectionTache()),
                        );*/
                          },
                          child: const Text(
                            'Ajouter',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
          )),
    );
  }
}
