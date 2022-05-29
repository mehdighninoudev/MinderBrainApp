import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../ForgotPassword/ForgotPassword.dart';
import '../SignUp/SignUp.dart';
import '../ReminderTasks/ReminderTask.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Login extends StatelessWidget {
  //final DBRef = FirebaseDatabase.instance.reference();
  //String email = '';
  //String password = '';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/1.jpg"),
              fit: BoxFit.cover,
              /*colorFilter:
                      
                        ColorFilter.mode(Colors.white, BlendMode.darken)*/
            )),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 200,
                    child: Center(

                        //child: Image(image: AssetImage("../../../images/logo.png")),
                        child: Image.asset(
                      'images/loog2.png',
                    )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Text("Login",
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 30, fontWeight: FontWeight.bold))),
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
                          controller: emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              FontAwesomeIcons.solidEnvelope,
                              color: Color.fromARGB(255, 102, 100, 100),
                              size: 20,
                            ),
                            border: InputBorder.none,
                            hintText: ' Saisir email',
                          ),

                          /* onChanged: (value) {
                        email = value;
                  },*/
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200]?.withOpacity(0.5),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                FontAwesomeIcons.lock,
                                color: Color.fromARGB(255, 102, 100, 100),
                                size: 20,
                              ),
                              border: InputBorder.none,
                              hintText: ' Saisir mot de passe',
                            ),

                            /*onChanged: (value){
                password = value;
              },*/
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
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
                            var email = emailController.text.trim();
                            var password = passwordController.text.trim();

                            if (email.isEmpty || password.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Please fill all fields');
                              return;
                            }

                            // request to firebase auth

                            ProgressDialog pr = ProgressDialog(context,
                                type: ProgressDialogType.Normal,
                                isDismissible: true,
                                showLogs: false);
                            pr.style(
                                message: 'Logging In',
                                borderRadius: 10.0,
                                backgroundColor: Colors.white,
                                progressWidget: CircularProgressIndicator(),
                                elevation: 10.0,
                                insetAnimCurve: Curves.easeInOut,
                                progress: 0.0,
                                maxProgress: 100.0,
                                progressTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400),
                                messageTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w600));

                            pr.hide().then((isHidden) {
                              print(isHidden);
                            });

                            pr.show();

                            try {
                              FirebaseAuth auth = FirebaseAuth.instance;

                              UserCredential userCredential =
                                  await auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (userCredential.user != null) {
                                pr.hide();
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ReminderTask();
                                }));
                              }
                            } on FirebaseException catch (e) {
                              pr.hide();

                              if (e.code == 'user-not-found') {
                                Fluttertoast.showToast(msg: 'User not found');
                              } else if (e.code == 'wrong-password') {
                                Fluttertoast.showToast(msg: 'Wrong password');
                              }
                            } catch (e) {
                              Fluttertoast.showToast(
                                  msg: 'Something went wrong');
                              pr.hide();
                            }

                            /*DBRef.once().then((DatabaseEvent dataSnapShot) {
                           // ignore: avoid_print
                           print(dataSnapShot.snapshot.value.toString());
                         });*/
                          },
                          child: Container(
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Container(
                      child: TextButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Pas Inscrit?',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '   Inscrivez-vous!',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 140, 255),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                            // Navigate to sign up page
                          }))
                ])),
          )),
    );
  }
}
