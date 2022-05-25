import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'package:firebase_database/firebase_database.dart';
import '../Quizzs/Quizz.dart';
import '../Login/Login.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';





class SignUp extends StatefulWidget {
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends  State<SignUp> {
  //String _uid = 'USER_UNIQUE_IDENTIFIER';
  //String email = '';
  //String password = '';
  //int RND = 0;
  var emailController = TextEditingController();
  var passwordContoller = TextEditingController();
  //final DBRef = FirebaseDatabase.instance.reference();

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
            child: SingleChildScrollView(child: Column(   
              verticalDirection: VerticalDirection.down, 
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                
                Center(
                  child: Image.asset('images/logo.png'),
                  //child: Image(image: AssetImage("../images/logo.png")),
                ),

                Center(
                  child: Text("Inscription", 
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
                     labelText: 'Entrer email',
                  ),

                  /*onChanged: (value){
                    email = value.toString().trim();
                  },*/
               ),
            ),

             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                  controller: passwordContoller,
                  obscureText: true,
                  decoration: InputDecoration(
                  labelText: 'Choisir mot de passe',
              ),

              /*onChanged: (value){
                    password = value.toString().trim();
                  },*/
            )
          ), 


            SizedBox( 
                height: 20,
            ),
  
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                 child: ElevatedButton(
                
                 style: ElevatedButton.styleFrom( 
                   fixedSize: Size(500, 50), primary: Colors.blue
                 ),
                 onPressed: ()  async{
                   var email = emailController.text.trim();
                   var password = passwordContoller.text.trim();

                   if(email.isEmpty || password.isEmpty) {
                     Fluttertoast.showToast(msg: 'Please fill all fields');
                     return;
                   }

                   if(password.length < 6){ 
                     Fluttertoast.showToast(msg: 'Weak Password, at least 6 characters are required');
                     return;
                   }

                   ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);
                    pr.style(
                       message: 'Signing Up',
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
                    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
                    if(userCredential.user != null) {
                      // store user information in realtime database 
                      DatabaseReference userRef = FirebaseDatabase.instance.reference().child('users');

                      String uid = userCredential.user!.uid;
                      await userRef.child(uid).set({  
                        'email': email,
                        'password': password,
                        'uid': uid,
                      });

                      

                      Fluttertoast.showToast(msg: 'Success');

                       pr.hide();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                        return Quizz();
                      }));
                    } else {
                      Fluttertoast.showToast(msg: 'Failed');
                    }
                   
                    pr.hide();
                  } on FirebaseAuthException catch(e) {
                     pr.hide();
                    if(e.code == 'email-already-in-use') {
                      Fluttertoast.showToast(msg: 'Email is already in Use');
                    } else if(e.code == 'weak-password') {
                      Fluttertoast.showToast(msg: 'Password is weak');
                    }
                  } 
                  
                  catch(e) {
                    
                    
                    Fluttertoast.showToast(msg: 'Something went wrong');
                  }

                   /*FirebaseAuth auth = FirebaseAuth.instance;

                   UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);

                   if(userCredential.user != null) {
                     Fluttertoast.showToast(msg: 'Success');

                   } else {
                     Fluttertoast.showToast(msg: 'Failed');
                   }*/
                  
                 /*String key = DBRef.child("admin").push().key!;
                  DBRef.child("admin").child(key).set({
                    'email':'${email}',
                    'password':'${password}'
                  });*/
                  

                  /*DBRef.child("admin").update({
                    'email':'${email}',
                    'password':'${password}',
                  });*/

                   /*final adminDao = AdminDAO();

                    final admin = Admin(email, password);
                    adminDao.saveAdmin(admin);
                    setState(() {});*/

                    /*FirebaseApp primaryApp = Firebase.app('MinderBrain');
                    FirebaseDatabase database = FirebaseDatabase.instanceFor(app: primaryApp);
                    DatabaseReference reference = FirebaseDatabase.instance.ref("minderbrain/admin");

                   reference.set({
                     "email":"ghninoupro@outlook.fr",
                     "password":"emsi2022"
                   });*/

                  /*try {
                      _auth.createUserWithEmailAndPassword(
                       email: email, password: password);
                      ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.blueGrey,
                                        content: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              'Sucessfully Register.You Can Login Now'),
                                        ),
                                        duration: Duration(seconds: 5),
                                      ),
                                    );
                                    Navigator.push(  
                                    context, 
                                     MaterialPageRoute(builder: (context) =>  Quizz()),
                                    );
                                    
                                  }*/ /*on FirebaseAuthException catch (e) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title:
                                            Text(' Ops! Registration Failed'),
                                        content: Text('${e.message}'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Text('Okay'),
                                          )
                                        ],
                                      ),
                                    );
                                  }*/
                 },
                 child: const Text('Inscription', 
                 style: TextStyle(color: Colors.white),

                 ),
            ),
                
          ),

          SizedBox(height: 12.0),

          Container(  
            child: TextButton(  
                child: Text("Deja membre? Identifiez-vous!"),
                onPressed: () {
                  // Navigate to sign up page
                  Navigator.push(  
                    context, 
                    MaterialPageRoute(builder: (context) =>  Login()),
                  );

                  
                },

                
              )

            )
          
          
              ]
          ),)
            
             ,
          )
        ),
        
      );
  }
}