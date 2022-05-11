
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'Quizz4.dart';

class Quizz3 extends StatefulWidget {
  State<Quizz3> createState() => _Quizz3();
}

enum CheckedQuizz3 {sometimes, always, never}
CheckedQuizz3 sometimes3 = CheckedQuizz3.sometimes;
CheckedQuizz3 always3 = CheckedQuizz3.always;
CheckedQuizz3 never3 = CheckedQuizz3.never;

class _Quizz3 extends  State<Quizz3> {
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
                    child: Text( "Question 5", 
                     style: TextStyle(color: Colors.black),
                    ),
                  )
                  ),

                  ListTile (  
                        title: Text("parfois"),
                        leading: Radio(  
                          value: CheckedQuizz3.sometimes,
                          groupValue: CheckedQuizz3, 
                          onChanged: (CheckedQuizz3){
                            setState(() => {
                              CheckedQuizz3 = CheckedQuizz3,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("toujours"),
                        leading: Radio(  
                          value: CheckedQuizz3.always,
                          groupValue: CheckedQuizz3, 
                          onChanged: (CheckedQuizz3){
                            setState(() => {
                              CheckedQuizz3 = CheckedQuizz3,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("jamais"),
                        leading: Radio(  
                          value: CheckedQuizz3.never,
                          groupValue: CheckedQuizz3, 
                          onChanged: (CheckedQuizz3){
                            setState(() => {
                              CheckedQuizz3 = CheckedQuizz3,
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
                    child: Text( "Question 6", 
                     style: TextStyle(color: Colors.black),
                    ),
                  )
                  ),

                  ListTile (  
                        title: Text("parfois"),
                        leading: Radio(  
                          value: CheckedQuizz3.sometimes,
                          groupValue: CheckedQuizz3, 
                          onChanged: (CheckedQuizz3){
                            setState(() => {
                              CheckedQuizz3 = CheckedQuizz3,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("toujours"),
                        leading: Radio(  
                          value: CheckedQuizz3.always,
                          groupValue: CheckedQuizz3, 
                          onChanged: (CheckedQuizz3){
                            setState(() => {
                              CheckedQuizz3 = CheckedQuizz3,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("jamais"),
                        leading: Radio(  
                          value: CheckedQuizz3.never,
                          groupValue: CheckedQuizz3, 
                          onChanged: (CheckedQuizz3){
                            setState(() => {
                              CheckedQuizz3 = CheckedQuizz3,
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
                             MaterialPageRoute(builder: (context) => Quizz4()),
                        );

                 },
                 child: const Text('Suivant', 
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


