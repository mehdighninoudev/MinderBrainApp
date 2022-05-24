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
        title: Text("MinderBrain App"),
      ),

      body:  SafeArea(
        child: Column(children: [
          Center(child: Image.asset("images/logo.png")),
          Center(child: Text("Modifier Tache", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 22.0),)),

          SizedBox(height: 25),
          TextField( 
            controller: nameController,
            decoration: InputDecoration( 
              hintText: 'Nom De Tache',
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(onPressed: () async {
            var taskName = nameController.text.trim();
            if(taskName.isEmpty) {
              Fluttertoast.showToast(msg: 'Merci de saisir le nom de tache');
              return;
            }

            User? user = FirebaseAuth.instance.currentUser;
            if(user != null) {
              DatabaseReference taskRef = FirebaseDatabase.instance.reference().child("tasks").child(user!.uid).child(widget.task.taskId);
              await taskRef.update({'taskName': taskName});
            }
          }, child: Text("Modifier")),

        ],)
      ),
    );
  }
}