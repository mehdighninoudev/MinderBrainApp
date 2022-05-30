import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:minderbrain/Widgets/UpdateTaskScreen/UpdateTaskScreen.dart';

import 'TaskModel.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreen createState() => _TasksScreen();
}

class _TasksScreen extends State<TasksScreen> {
  User? user;
  DatabaseReference? taskRef;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      taskRef =
          FirebaseDatabase.instance.reference().child('tasks').child(user!.uid);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("                Page Tasks"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Center(
                  child: Image.asset(
                    'images/loog2.png',
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Voir Taches",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 22.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<DatabaseEvent>(
                stream: taskRef != null ? taskRef!.onValue : null,
                builder: (context, snapshot) {
                  if (snapshot.hasData && !snapshot.hasError) {
                    var event = snapshot.data as DatabaseEvent;
                    var snapshot2 = event.snapshot.value;
                    if (snapshot2 == null) {
                      return Center(
                        child: Text("Pas de taches ajoutees"),
                      );
                    }

                    Map<dynamic, dynamic> map =
                        snapshot2 as Map<dynamic, dynamic>;
                    //Map<String, dynamic> map = snapshot2;
                    //Map<String, dynamic> map = Map<String, dynamic>.from(snapshot2);
                    // Map<String, dynamic> map = new Map<String, dynamic>.from(json.decode(snapshot2 as String));
                    var tasks = <TaskModel>[];

                    for (var taskMap in map.values) {
                      TaskModel taskModel =
                          TaskModel.fromMap(Map<String, dynamic>.from(taskMap));
                      tasks.add(taskModel);
                    }

                    //return Center(child: Text(tasks.length.toString()),);
                    return Container(
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
                      child: Padding(
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
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(task.taskName),
                                      Text(getHumanReadableDate(task.dt)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          "Confirmation !!!"),
                                                      content: Text(
                                                          "Ar you sure to delete ?"),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text("Non")),
                                                        TextButton(
                                                            onPressed:
                                                                () async {
                                                              if (taskRef !=
                                                                  null) {
                                                                await taskRef!
                                                                    .child(task
                                                                        .taskId)
                                                                    .remove();
                                                              }
                                                              Navigator.of(ctx)
                                                                  .pop();
                                                            },
                                                            child: Text("Oui")),
                                                      ],
                                                    );
                                                  });
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return UpdateTaskScreen(
                                                    task: task);
                                              }));
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ));
                            }),
                      ),
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
        ),
      ),
    );
  }

  String getHumanReadableDate(int dt) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt);
    return DateFormat('dd MMM yyy').format(dateTime);
  }
}
