

import 'package:flutter/material.dart';
import 'package:minderbrain/Widgets/AddTasks/Task.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:link_text/link_text.dart';
import '../Login/Login.dart';
import '../PatientDashboard/PatientDashboard.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../AddPatient/Patient.dart';
import 'package:minderbrain/Widgets/Localisation/Localisation.dart';

import 'package:firebase_auth/firebase_auth.dart';


class ReminderTask extends StatefulWidget {
  State<ReminderTask> createState() => _ReminderTask();
}


//String Checked = "";
  ValueChanged _onChanged = (val) => print(val);

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
_signOut() async {
  await _firebaseAuth.signOut();
}

class _ReminderTask extends State<ReminderTask> {
  int radioValue = -1;
  bool isChecked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String Checked = '';
  
  Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: Scaffold( 
        backgroundColor: Colors.white, 
         appBar: AppBar(  
           title: Text("MinderBrain App"),
         ),

         body: 
           SafeArea(  
             child: Column(  
               verticalDirection: VerticalDirection.down,
               crossAxisAlignment: CrossAxisAlignment.start,

               children: [

                SizedBox(height: 25),

                 Center (  
                   child: Text( "Page Admin", 
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize:22.0),

                   )),

                   SizedBox(height: 20.0),
                  
                  

                  SizedBox(height: 20.0),

                  Center(  
                    child: Text("Gerer les taches!", 
                    style: TextStyle(fontSize: 20.0),
                    )
                  ),

                   SizedBox(height: 25.0),




                    // ignore: unnecessary_new
                    new Column(
                    

                    children: <Widget>[

                      // ignore: unnecessary_new
                      new Form(
                         key: _formKey, child: Column(children: [
                          new RadioListTile<int>(
                          title: new Text('Creer le patient'),
                          value: 0,
                          groupValue: radioValue,
                          onChanged: (value) {setState(() => {radioValue = value as int});}),
                      // ignore: unnecessary_new
                      new RadioListTile<int>(
                          title: new Text('Creer les taches'),
                          value: 1,
                          groupValue: radioValue,
                          onChanged: (value) {setState(() => {radioValue = value as int});}),
                      new RadioListTile<int>(
                          title: new Text('Modifier les taches'),
                          value: 3,
                          groupValue: radioValue,
                          onChanged: (value) {setState(() => {radioValue = value as int});}),
                           new RadioListTile<int>(
                          title: new Text('Supprimer les taches'),
                          value: 4,
                          groupValue: radioValue,
                          onChanged: (value) {setState(() => {radioValue = value as int});}),
                           new RadioListTile<int>(
                          title: new Text('Voir les taches'),
                          value: 5,
                          groupValue: radioValue,
                          onChanged: (value) {setState(() => {radioValue = value as int});}),

                           new RadioListTile<int>(
                          title: new Text('Voir les taches completees'),
                          value: 6,
                          groupValue: radioValue,
                          onChanged: (value) {setState(() => {radioValue = value as int});}),
                         ]),
                      ),
                      // ignore: unnecessary_new
                     
                    ],
                  ),


                  /*Column( 
                    children: <Widget> [
                      ListTile (  
                        title: Text("Creer le patient"),
                        leading: Radio(  
                          value: "createUser",
                          groupValue: Checked, 
                          onChanged: (value){
                            setState(() => {
                              Checked = value as String,
                            });
                          }
                          
                        ),
                      ),
                      ListTile (  
                        title: Text("Creer les taches"),
                        leading: Radio(  
                          value: "createTasks",
                          groupValue: Checked, 
                          onChanged: (value){
                            setState(() => {
                              Checked = value as String,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("Modifier les taches"),
                        leading: Radio(  
                          value: "editTasks",
                          groupValue: Checked, 
                          onChanged: (value){
                            setState(() => {
                              Checked = value as String,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("Supprimer les taches"),
                        leading: Radio(  
                          value: "deleteTasks",
                          groupValue: Checked, 
                          onChanged: (value){
                            setState(() => {
                              Checked = value as String,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("Voir les taches"),
                        leading: Radio(  
                          value: "select",
                          groupValue: Checked, 
                          onChanged: (value){
                            setState(() => {
                              Checked = value as String,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("Voir les taches completes"),
                        leading: Radio(  
                          value: "selectAll",
                          groupValue: Checked, 
                          onChanged: (value){
                            setState(() => {
                              Checked = value as String,
                            });
                          }
                          
                        ),
                      ),*/

                    Center(child:Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: FloatingActionButton.extended(
                        label: Text('Localisation'),
                        backgroundColor: Colors.deepOrange,
                        icon: Icon(
                          Icons.location_on,
                          
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Localisation()),
                          );
                        },
                      ),
                    ),),
             
                    
              

                      

                      Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                 child: ElevatedButton(
                
                 style: ElevatedButton.styleFrom( 
                   fixedSize: Size(500, 50), primary: Colors.blue,
                   
                 ),
                 onPressed: _validateInputs/*() {
                 onPressed: () {
                      Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );

                
                
                } */,
                 child: const Text('Valider', 
                 style: TextStyle(color: Colors.white),

                 ),
            ),
                
          ),

        
            Center(
              child: TextButton(  
                child: Text("Page Patient"),
                onPressed: () {
                  // Navigate to sign up page
                  Navigator.push(  
                    context, 
                    MaterialPageRoute(builder: (context) =>  PatientDashboard()),
                  );
                }
              ), 
            ),

             
             Center(child:TextButton(  
                child: Text("Logout"),
                onPressed: () async {
                    showDialog(context: context, builder: (ctx){
                      return AlertDialog(
                        title: Text("Confirmation !!!"),
                        content: Text("Etes vous sure de vouloir vous deconncter ?"),
                        actions: [
                          TextButton(onPressed:  () {
                            Navigator.of(ctx).pop();
                          }, child:Text("Non"),),
                          TextButton(onPressed:  () {
                            Navigator.of(ctx).pop();
                            FirebaseAuth.instance.signOut();

                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                            return Login();
                          }));

                          }, child:Text("Oui"),),
                        ],
                      );
                    });

                    

                    /*await _signOut();
                    if (_firebaseAuth.currentUser == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );}*/
                    }
              )),
            

                    ]
                 )
                                  
               //]
             )
           )
         
      //)
    );
  }

   void _validateInputs() {
     final form = _formKey.currentState;
     if(form!.validate()) {
       
       if(radioValue < 0) {
         SnackBar(content: Text('Merci de selectionner une tache a accomplir!'));
       }

       else if (radioValue == 0) {
         Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => AddPatient()),
                    );
       }

       else if (radioValue == 1) {
         Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => AddTask()),
                    );
       }

       else if (radioValue == 2) {
         Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
       }

       else if (radioValue == 3) {
         Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
       }

       else if (radioValue == 4) {
         Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
       }
       

       else if (radioValue == 5) {
         Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
       }

       else if (radioValue == 6) {
         Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
       }
   }
}

}