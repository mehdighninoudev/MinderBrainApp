
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../Login/Login.dart';


class PatientDashboard extends StatefulWidget {
  State<PatientDashboard> createState() => _PatientDashboard();
}

class _PatientDashboard extends State<PatientDashboard>{
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: Scaffold (  
        backgroundColor: Colors.white,
        appBar: AppBar(  
          title: Text("MinderBrain App"),
        ),

        body: SafeArea( 
          child: Column(  
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,

              // ignore: prefer_const_literals_to_create_immutables
              children: [  
             /* Center (  
                child: Image(image: AssetImage("../images/logo.png")),
              ),*/

              Center(
                  child: Image.asset('images/logo.png', width:150, height:150),
                  //child: Image(image: AssetImage("../images/logo.png")),
                ),

              Center ( 
                child: Text("Page Patient!", 
                style: TextStyle(fontWeight: FontWeight.bold, color:Colors.blueGrey, fontSize: 22.0),
                ),
              ), 

              SizedBox(height: 22.0),

               Container(   
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(7.0),
                      
                      decoration: BoxDecoration(  
                        color: Colors.orangeAccent,
                        border: Border.all(color: Colors.orangeAccent, width: 3.0),
                        
                         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),

                     
                      child: Center(  
                    child: Text( "Bienvenues ! Ici vous pouvez valider vos taches. Bonne journee!", 
                     style: TextStyle(color: Colors.white),
                    ),
                  )
                  ),

                  
                    // ignore: prefer_const_literals_to_create_immutables
                    Column (children: [
                      Center(child: Text("Nom: Mr XX XX" , style: TextStyle(fontSize: 18.0)),
                      
                      ),
                      Center( child: Text("Score: 50/100",  style: TextStyle(fontSize: 18.0)),)
                    ],)
                    
                    
                ,

                  Container(   
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(7.0),
                      
                      decoration: BoxDecoration(  
                        color: Colors.lightBlue,
                        border: Border.all(color: Colors.lightBlue, width: 3.0),
                        
                         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),


                      // ignore: prefer_const_literals_to_create_immutables
                      child: Column(children: [
                        Row(children: [
                        Center(  
                        child: Text("Tache 1",
                        style: TextStyle(color: Colors.white, fontSize: 15.0, 
                        )),
                     ),

                     SizedBox(width: 210.0),


                      TextButton(  
                       child: Text("Valider", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                       onPressed: () {
                  // Navigate to sign up page
                       
                }
              ), 



                        ],),

                        SizedBox(height: 10.0),

                        Row(children: [
                        Center(  
                        child: Text("Tache 2",
                        style: TextStyle(color: Colors.white, fontSize: 15.0, 
                        )),
                     ),

                     SizedBox(width: 210.0),


                      TextButton(  
                       child: Text("Valider", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                       onPressed: () {
                  // Navigate to sign up page
                       
                }
              ), 

                        ],),

                        SizedBox(height: 10.0),

                        Row(children: [
                        Center(  
                        child: Text("Tache 3",
                        style: TextStyle(color: Colors.white, fontSize: 15.0, 
                        )),
                     ),

                     SizedBox(width: 210.0),


                      TextButton(  
                       child: Text("Valider", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                       onPressed: () {
                  // Navigate to sign up page
                       
                }
              ), 

                        ],),

                        SizedBox(height: 10.0),

                        Row(children: [
                        Center(  
                        child: Text("Tache 4",
                        style: TextStyle(color: Colors.white, fontSize: 15.0, 
                        )),
                     ),

                     SizedBox(width: 210.0),


                      TextButton(  
                       child: Text("Valider", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                       onPressed: () {
                  // Navigate to sign up page
                       
                }
              ), 

                        ],),

                        SizedBox(height: 10.0),

                        Row(children: [
                        Center(  
                        child: Text("Tache 5",
                        style: TextStyle(color: Colors.white, fontSize: 15.0, 
                        )),
                     ),

                     SizedBox(width: 210.0),


                      TextButton(  
                       child: Text("Valider", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                       onPressed: () {
                  // Navigate to sign up page
                       
                }
              ), 

                        ],),



                       
                    
                    
                     

                   ],
                ) 
                      

                  
               ), 

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                 child: ElevatedButton(
                
                 style: ElevatedButton.styleFrom( 
                   fixedSize: Size(500, 50), primary: Colors.orange,
                   
                 ),
                 onPressed: () {
                      Navigator.push(   
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );

                 },
                 child: const Text('Page Admin', 
                 style: TextStyle(color: Colors.white),

                 ),
            ),
                
          ),

                
                  
            ], 
          )
        )
      ),
    );
  }
}