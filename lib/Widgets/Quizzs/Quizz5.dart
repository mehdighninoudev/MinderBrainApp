
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import '../ReminderTasks/ReminderTask.dart';


class Quizz5 extends StatefulWidget {
  State<Quizz5> createState() => _Quizz5();
}

enum CheckedQuizz5 {sometimes, always, never}
CheckedQuizz5 sometimes5 = CheckedQuizz5.sometimes;
CheckedQuizz5 always5 = CheckedQuizz5.always;
CheckedQuizz5 never5 = CheckedQuizz5.never;

class _Quizz5 extends  State<Quizz5> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold( 
        backgroundColor: Colors.white12, 
        appBar: AppBar( 
          title: Text("MinderBrain App"),
        ),

        body: SafeArea(  
          child: Column(  
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,

            // ignore: prefer_const_literals_to_create_immutables
            children: [  
              Center(  
                child: Image(image: AssetImage("../images/logo.png")),
                
              ), 

              Center ( 
                child: Text("Passez Le Quizz!", 
                style: TextStyle(fontWeight: FontWeight.bold, color:Colors.blueGrey, fontSize: 22.0),
                ),
              ), 

              SizedBox(height: 22.0),


              Container(   
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(7.0),
                      
                      decoration: BoxDecoration(  
                        
                        border: Border.all(color: Colors.orangeAccent, width: 2.0),
                        
                         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),

                     
                      child: Center(  
                    child: Text( "Question 9", 
                     style: TextStyle(color: Colors.black),
                    ),
                  )
                  ),

                  ListTile (  
                        title: Text("parfois"),
                        leading: Radio(  
                          value: CheckedQuizz5.sometimes,
                          groupValue: CheckedQuizz5, 
                          onChanged: (CheckedQuizz5){
                            setState(() => {
                              CheckedQuizz5 = CheckedQuizz5,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("toujours"),
                        leading: Radio(  
                          value: CheckedQuizz5.always,
                          groupValue: CheckedQuizz5, 
                          onChanged: (CheckedQuizz5){
                            setState(() => {
                              CheckedQuizz5 = CheckedQuizz5,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("jamais"),
                        leading: Radio(  
                          value: CheckedQuizz5.never,
                          groupValue: CheckedQuizz5, 
                          onChanged: (CheckedQuizz5){
                            setState(() => {
                              CheckedQuizz5 = CheckedQuizz5,
                            });
                          }
                          
                        ),
                      ),





                      Container(   
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(7.0),
                      
                      decoration: BoxDecoration(  
                        
                        border: Border.all(color: Colors.orangeAccent, width: 2.0),
                        
                         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),

                     
                      child: Center(  
                    child: Text( "Question 10", 
                     style: TextStyle(color: Colors.black),
                    ),
                  )
                  ),

                  ListTile (  
                        title: Text("parfois"),
                        leading: Radio(  
                          value: CheckedQuizz5.sometimes,
                          groupValue: CheckedQuizz5, 
                          onChanged: (CheckedQuizz5){
                            setState(() => {
                              CheckedQuizz5 = CheckedQuizz5,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("toujours"),
                        leading: Radio(  
                          value: CheckedQuizz5.always,
                          groupValue: CheckedQuizz5, 
                          onChanged: (CheckedQuizz5){
                            setState(() => {
                              CheckedQuizz5 = CheckedQuizz5,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("jamais"),
                        leading: Radio(  
                          value: CheckedQuizz5.never,
                          groupValue: CheckedQuizz5, 
                          onChanged: (CheckedQuizz5){
                            setState(() => {
                              CheckedQuizz5 = CheckedQuizz5,
                            });
                          }
                          
                        ),
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
                             MaterialPageRoute(builder: (context) => ReminderTask()),
                        );

                 },
                 child: const Text('Page Admin', 
                 style: TextStyle(color: Colors.white),

                 ),
            ),
                
          ),

                  
            ],
          ),
        ),
      ),
    );
  }
}







