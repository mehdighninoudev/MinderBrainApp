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
import 'package:firebase_core/firebase_core.dart';

class AddPatient extends StatefulWidget {
  @override
  State<AddPatient> createState() => _AddPatient();
}

class _AddPatient extends State<AddPatient> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  var patientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 160, 194, 225),
          appBar: AppBar(
            title: Text("                          Page Patient",
                style: TextStyle(
                  fontSize: 20,
                )),
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
                      child: Image.asset(
                        'images/loog2.png',
                      ),
                      //child: Image(image: AssetImage("../images/logo.png")),
                    ),
                  ),
                  SizedBox(height: 30),
                  /*Center(
                  child: Image(image: AssetImage("../images/logo.png")),
                ),*/

                  Center(
                      child: Text(
                    "Ajouter Patient",
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
                          controller: patientController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Saisir nom patient',
                          ),

                          /*onChanged: (value) {
                      nomPatient = value;
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
                            /* Navigator.push(   
                          context,
                          MaterialPageRoute(builder: (context) => Redirection()),
                        );*/

                            String patientName = patientController.text.trim();
                            if (patientName.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Merci de saisir un patient');
                              return;
                            }

                            User? user = FirebaseAuth.instance.currentUser;

                            if (user != null) {
                              String uid = user.uid;
                              int dt = DateTime.now().millisecondsSinceEpoch;

                              DatabaseReference patientRef = FirebaseDatabase
                                  .instance
                                  .reference()
                                  .child('patient')
                                  .child(uid);

                              String patientId = patientRef.push().key!;
                              await patientRef.child(patientId).set({
                                'patientId': patientId,
                                "patientName": patientName,
                                'patientScore': 0
                              });

                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Redirection();
                              }));
                            }
                          },
                          child: const Text(
                            'Ajouter',
                            style: TextStyle(fontSize: 15, color: Colors.white),
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
