import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../Login/Login.dart';
import 'package:minderbrain/Widgets/VoirTaches/TaskModel.dart';
import 'package:minderbrain/Widgets/PatientDashboard/Redirection.dart';
import 'package:minderbrain/Widgets/PatientDashboard/PatientModel.dart';

class PatientDashboard extends StatefulWidget {
  State<PatientDashboard> createState() => _PatientDashboard();
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
_signOut() async {
  await _firebaseAuth.signOut();
}

class _PatientDashboard extends State<PatientDashboard> {
  final completed = "1";

  var tasks = <TaskModel>[];

  User? user;
  DatabaseReference? patientRef;
  DatabaseReference? taskRef;

  void initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      patientRef = FirebaseDatabase.instance
          .reference()
          .child('patient')
          .child(user!.uid);
      taskRef =
          FirebaseDatabase.instance.reference().child('tasks').child(user!.uid);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Page Patient!"),
          ),
          body: Container(
            height: double.infinity,
                width: double.infinity,
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
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.start,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  /* Center (  
                  child: Image(image: AssetImage("../images/logo.png")),
                ),*/

                 SizedBox(
                          height: 130,
                          child: Center(

                              //child: Image(image: AssetImage("../../../images/logo.png")),
                              child: Image.asset(
                            'images/loog2.png',
                          )),
                        ),

                  

                  SizedBox(height: 22.0),

                  Container(
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(7.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border:
                            Border.all(color: Colors.black, width: 3.0),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Center(
                        child: Text(
                          "Bienvenues ! Ici vous pouvez valider vos taches. Bonne journee!",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),

                  // ignore: prefer_const_literals_to_create_immutables
                  Column(
                    children: [
                      /* Center(child: Text("Nom: " + patient.patientName ,  style: TextStyle(fontSize: 18.0)),
                        
                        ),
                        Center( child: Text("Score: 50/100",  style: TextStyle(fontSize: 18.0)),)*/

                      StreamBuilder<DatabaseEvent>(
                        stream: patientRef != null ? patientRef!.onValue : null,
                        builder: (context, snapshot) {
                          if (snapshot.hasData && !snapshot.hasError) {
                            var event = snapshot.data as DatabaseEvent;
                            var snapshot2 = event.snapshot.value;
                            if (snapshot2 == null) {
                              return Center(
                                child: Text("Pas de patient ajoute"),
                              );
                            }

                            Map<dynamic, dynamic> map =
                                snapshot2 as Map<dynamic, dynamic>;
                            //Map<String, dynamic> map = snapshot2;
                            //Map<String, dynamic> map = Map<String, dynamic>.from(snapshot2);
                            // Map<String, dynamic> map = new Map<String, dynamic>.from(json.decode(snapshot2 as String));
                            var patients = <PatientModel>[];

                            for (var patientMap in map.values) {
                              //TaskModel taskModel = TaskModel.fromMap(Map<String, dynamic>.from(taskMap));
                              /*if(){
                    TaskModel taskModel = TaskModel.fromMap(Map<String, dynamic>.from(taskMap));
                    tasks.add(taskModel);
                  }*/

                              PatientModel patientModel = PatientModel.fromMap(
                                  Map<String, dynamic>.from(patientMap));
                              patients.add(patientModel);

                              //tasks.add(taskModel);
                            }

                            //return Center(child: Text(tasks.length.toString()),);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: patients.length,
                                  itemBuilder: (context, index) {
                                    PatientModel patient = patients[index];
                                    return Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Column(
                                          children: [
                                            Text("Mr ${patient.patientName}",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            //Text(getHumanReadableDate(task.dt)),
                                          ],
                                        ));
                                  }),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )
                    ],
                  ),

                  Container(
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(7.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        border: Border.all(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.185),
                      spreadRadius: 3,
                      blurRadius: 2,
                    ),
                  ],
                      ),

                      // ignore: prefer_const_literals_to_create_immutables
                      child: Column(
                        children: [
                          SingleChildScrollView(
                              child: StreamBuilder<DatabaseEvent>(
                            stream: taskRef != null ? taskRef!.onValue : null,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && !snapshot.hasError) {
                                var event = snapshot.data as DatabaseEvent;
                                var snapshot2 = event.snapshot.value;
                                if (snapshot2 == null) {
                                  return Center(
                                    child: Text("Pas de taches ajoutees", style: TextStyle(color: Colors.white)),
                                  );
                                }

                                Map<dynamic, dynamic> map =
                                    snapshot2 as Map<dynamic, dynamic>;
                                //Map<String, dynamic> map = snapshot2;
                                //Map<String, dynamic> map = Map<String, dynamic>.from(snapshot2);
                                // Map<String, dynamic> map = new Map<String, dynamic>.from(json.decode(snapshot2 as String));
                                var tasks = <TaskModel>[];

                                for (var taskMap in map.values) {
                                  TaskModel taskModel = TaskModel.fromMap(
                                      Map<String, dynamic>.from(taskMap));
                                  tasks.add(taskModel);
                                }

                                //return Center(child: Text(tasks.length.toString()),);
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: tasks.length,
                                      itemBuilder: (context, index) {
                                        TaskModel task = tasks[index];
                                        return Container(
                                          
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(bottom: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: Colors.white.withOpacity(0.55),
                                              border: Border.all(
                                                  color: Colors.white.withOpacity(0.55), width: 1),
                                            ),
                                            child: Column(
                                              
                                              children: [
                                                
                                                Text(task.taskName, style: TextStyle(color: Colors.black)),
                                                Text(getHumanReadableDate(
                                                    task.dt),  style: TextStyle(color: Colors.black)),
                                                TextButton(
                                                    style: TextButton.styleFrom(
                                                        primary: Colors.black),
                                                    child: Text("Gerer"),
                                                    onPressed: () async {
                                                      TaskModel task =
                                                          tasks[index];

                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                RedirectionPatient(
                                                                    task: task)),
                                                      );
                                                      // Navigate to sign up page
                                                    })
                                              ],
                                            ));
                                      }),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ))

                          /*
                          Row(children: [
                          Center(  
                          child: Text("Tache 1",
                          style: TextStyle(color: Colors.white, fontSize: 15.0, 
                          )),
                       ),

                       SizedBox(width: 210.0),


                        TextButton(  
                         child: Text("Valider", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                         onPressed: () {
                    // Navigate to sign up page
                         
                  }
                ), 



                          ],),

                          SizedBox(height: 10.0),

                          Row(children: [
                          Center(  
                          child: Text("Tache 2",
                          style: TextStyle(color: Colors.white, fontSize: 15.0, 
                          )),
                       ),

                       SizedBox(width: 210.0),


                        TextButton(  
                         child: Text("Valider", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                         onPressed: () {
                    // Navigate to sign up page
                         
                  }
                ), 

                          ],),

                          SizedBox(height: 10.0),

                          Row(children: [
                          Center(  
                          child: Text("Tache 3",
                          style: TextStyle(color: Colors.white, fontSize: 15.0, 
                          )),
                       ),

                       SizedBox(width: 210.0),


                        TextButton(  
                         child: Text("Valider", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                         onPressed: () {
                    // Navigate to sign up page
                         
                  }
                ), 

                          ],),

                          SizedBox(height: 10.0),

                          Row(children: [
                          Center(  
                          child: Text("Tache 4",
                          style: TextStyle(color: Colors.white, fontSize: 15.0, 
                          )),
                       ),

                       SizedBox(width: 210.0),


                        TextButton(  
                         child: Text("Valider", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                         onPressed: () {
                    // Navigate to sign up page
                         
                  }
                ), 

                          ],),

                          SizedBox(height: 10.0),

                          Row(children: [
                          Center(  
                          child: Text("Tache 5",
                          style: TextStyle(color: Colors.white, fontSize: 15.0, 
                          )),
                       ),

                       SizedBox(width: 210.0),


                        TextButton(  
                         child: Text("Valider", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                         onPressed: () {
                    // Navigate to sign up page
                         
                  }
                ), 

                          ],),



                         
                      
                      
                       

                     */
                        ],
                      )),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(12)),
                                  fixedSize: Size(500, 50),
                                  primary: Colors.blue),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();

                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return Login();
                          }));
                        },
                        child: const Text(
                          'Page Admin',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          )),
    );
  }
}

String getHumanReadableDate(int dt) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt);
  return DateFormat('dd MMM yyy').format(dateTime);
}
