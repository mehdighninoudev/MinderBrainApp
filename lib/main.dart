
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'Widgets/Login/Login.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login()
    );
  }
}