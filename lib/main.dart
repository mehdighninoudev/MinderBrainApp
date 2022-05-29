
import 'package:flutter/material.dart';
import 'package:minderbrain/Widgets/ReminderTasks/ReminderTask.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'Widgets/Login/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "minderbrain2",
    // ignore: prefer_const_constructors
    options: FirebaseOptions(
      databaseURL: "https://minderbrain2-default-rtdb.firebaseio.com/",
      appId: "1:309799418831:android:8f638907642821e25ef0ba",
      projectId: "309799418831",
      apiKey: 'AIzaSyCYQXVYFICaijACTysRKhDLGd6OyO3Mktc', 
      messagingSenderId: '309799418831',
    ),
  );
  //await Firebase.initializeApp();
  runApp(MyApp());
  
}




class MyApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? Login() : ReminderTask(),
    );
  }
}