import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minderbrain/Widgets/VoirTaches/TaskModel.dart';

class UpdateTaskScreen extends StatefulWidget {
  final TaskModel task;
  const UpdateTaskScreen({Key? key, required this.task}) : super(key: key);
  @override
  _UpdateTaskScreen createState() => _UpdateTaskScreen();
}

class _UpdateTaskScreen extends State<UpdateTaskScreen> {
  var nameController = TextEditingController();

  void initState() {
    super.initState();
    nameController.text = widget.task.taskName;
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
          SizedBox(height: 20),
          SizedBox(
              height: 150,
              child: Center(child: Image.asset("images/loog2.png"))),
          Center(
              child: Text(
            "Modifier Tache",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                fontSize: 22.0),
          )),
          SizedBox(height: 30),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200]?.withOpacity(0.5),
                border: Border.all(color: Color.fromARGB(255, 174, 171, 171)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nom de la Tache',
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ElevatedButton(
                onPressed: () async {
                  var taskName = nameController.text.trim();
                  if (taskName.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Merci de saisir le nom de la tache');
                    return;
                  }

                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    DatabaseReference taskRef = FirebaseDatabase.instance
                        .reference()
                        .child("tasks")
                        .child(user.uid)
                        .child(widget.task.taskId);
                    await taskRef.update({'taskName': taskName});
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    fixedSize: const Size(500, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text("Modifier")),
          ),
        ],
      ))),
    );
  }
}
