

import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../Login/Login.dart';
import '../PatientDashboard/PatientDashboard.dart';


class ReminderTask extends StatefulWidget {
  State<ReminderTask> createState() => _ReminderTask();
}

enum Checked {create, edit, delete, select, select_complete}
Checked chk = Checked.create;
Checked chk_edit = Checked.edit;
Checked chk_delete = Checked.delete;
Checked chk_select = Checked.select;
Checked chk_select_complete = Checked.select_complete;

class _ReminderTask extends State<ReminderTask> {
  bool isChecked = false;
  
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
        backgroundColor: Colors.white10, 
         appBar: AppBar(  
           title: Text("MinderBrain App"),
         ),

         body: 
           SafeArea(  
             child: Column(  
               verticalDirection: VerticalDirection.down,
               crossAxisAlignment: CrossAxisAlignment.start,

               children: [

                 Center(  
                   child: Image(image: AssetImage("../images/logo.png")),
                 ),

                 Center (  
                   child: Text( "Page Admin", 
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize:22.0),

                   )),

                   SizedBox(height: 20.0),
                  
                  Container(   
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(7.0),
                      
                      decoration: BoxDecoration(  
                        color: Colors.orangeAccent,
                        border: Border.all(color: Colors.orangeAccent, width: 3.0),
                        
                         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),

                     
                      child: Center(  
                    child: Text( "Ici c'est la page admin.", 
                     style: TextStyle(color: Colors.white),
                    ),
                  )
                  ),

                  SizedBox(height: 20.0),

                  Center(  
                    child: Text("Gerer les taches!", 
                    style: TextStyle(fontSize: 20.0),
                    )
                  ),

                   SizedBox(height: 25.0),


                  Column( 
                    children: <Widget> [
                      ListTile (  
                        title: Text("Creer les taches"),
                        leading: Radio(  
                          value: Checked.create,
                          groupValue: chk, 
                          onChanged: (chk){
                            setState(() => {
                              chk = chk,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("Modifier les taches"),
                        leading: Radio(  
                          value: Checked.edit,
                          groupValue: chk_edit, 
                          onChanged: (chk_edit){
                            setState(() => {
                              chk_edit = chk_edit,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("Supprimer les taches"),
                        leading: Radio(  
                          value: Checked.delete,
                          groupValue: chk_delete, 
                          onChanged: (chk_delete){
                            setState(() => {
                              chk_delete = chk_delete,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("Voir les taches"),
                        leading: Radio(  
                          value: Checked.select,
                          groupValue: chk_select, 
                          onChanged: (chk_select){
                            setState(() => {
                              chk_select = chk_select,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("Voir les taches completes"),
                        leading: Radio(  
                          value: Checked.select_complete,
                          groupValue: chk_select_complete, 
                          onChanged: (chk_select_complete){
                            setState(() => {
                              chk_select_complete = chk_select_complete,
                            });
                          }
                          
                        ),
                      ),

                      

                      Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                 child: ElevatedButton(
                
                 style: ElevatedButton.styleFrom( 
                   fixedSize: Size(500, 50), primary: Colors.blue,
                   
                 ),
                 onPressed: () {
                      Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );

                 },
                 child: const Text('Valider', 
                 style: TextStyle(color: Colors.white),

                 ),
            ),
                
          ),

        
            TextButton(  
                child: Text("Page Patient"),
                onPressed: () {
                  // Navigate to sign up page
                  Navigator.push(  
                    context, 
                    MaterialPageRoute(builder: (context) =>  PatientDashboard()),
                  );
                }
              ), 

             
            TextButton(  
                child: Text("Logout"),
                onPressed: () {
                  // Navigate to sign up page
                  Navigator.push(  
                    context, 
                    MaterialPageRoute(builder: (context) =>  Login()),
                  );
                }
              )

                    ]
                 )
                                  
               ]
             )
           )
         
      )
    );
  }
}