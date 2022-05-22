
// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                  //child: Image(image: AssetImage("../../../images/logo.png")),
                  child: Image.asset('images/logo.png')
                ),

                Center(
                  child: Text("Login", 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 22.0),
)
                ),

                SizedBox( 
                 height: 20,
               ),

                
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                     child: TextFormField(
                       controller: emailController,
                     decoration: const InputDecoration(
                     border: UnderlineInputBorder(),
                     labelText: 'Saisir email',
                  ),

                 /* onChanged: (value) {
                    email = value;
                  },*/
               ),
            ),

             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                  labelText: 'Saisir mot de passe',
              ),

              /*onChanged: (value){
                password = value;
              },*/
            )
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
                 onPressed: () async{
        
                     var email = emailController.text.trim();
                     var password = passwordController.text.trim();

                     if(email.isEmpty || password.isEmpty) {
                       Fluttertoast.showToast(msg: 'Please fill all fields');
                       return;
                     }        

                     // request to firebase auth

                    ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);
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
                         color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
                         messageTextStyle: TextStyle(
                            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
                         );

                         pr.hide().then((isHidden) {
                           print(isHidden);
                         });

                        pr.show(); 

                        try {
                          FirebaseAuth auth = FirebaseAuth.instance;

                          UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
                          if(userCredential.user != null) {
                            pr.hide();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return ReminderTask();
                            }));  

                          } 
                        
                        } on FirebaseException catch (e) {
                          pr.hide();

                          if (e.code == 'user-not-found') {
                            Fluttertoast.showToast(msg: 'User not found');

                          } else if(e.code == 'wrong-password') {
                            Fluttertoast.showToast(msg: 'Wrong password');
                          }
                        }

                        catch(e) {
                          Fluttertoast.showToast(msg: 'Something went wrong');
                          pr.hide();
                        }



                      

                     /*DBRef.once().then((DatabaseEvent dataSnapShot) {
                       // ignore: avoid_print
                       print(dataSnapShot.snapshot.value.toString());
                     });*/

                 },
                 child: const Text('Login', 
                 style: TextStyle(color: Colors.white),

                 ),
            ),
                
          ),

          SizedBox(height: 12.0),
  
         
          Container(  
            child: TextButton(  
                child: Text("Pas Inscrit? Inscrivez-vous!"),
                onPressed: () {
                  Navigator.push(  
                    context, 
                    MaterialPageRoute(builder: (context) =>  SignUp()),
                  );
                  // Navigate to sign up page
                }
              )

            )
          
          
              ]
          ),
          )
        ),
         
      );
  }
}

