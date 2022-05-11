
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'Quizz5.dart';


class Quizz4 extends StatefulWidget {
  State<Quizz4> createState() => _Quizz4();
}

enum CheckedQuizz4 {sometimes, always, never}
CheckedQuizz4 sometimes4 = CheckedQuizz4.sometimes;
CheckedQuizz4 always4 = CheckedQuizz4.always;
CheckedQuizz4 never4 = CheckedQuizz4.never;

class _Quizz4 extends  State<Quizz4> {
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
                    child: Text( "Question 7", 
                     style: TextStyle(color: Colors.black),
                    ),
                  )
                  ),

                  ListTile (  
                        title: Text("parfois"),
                        leading: Radio(  
                          value: CheckedQuizz4.sometimes,
                          groupValue: CheckedQuizz4, 
                          onChanged: (CheckedQuizz4){
                            setState(() => {
                              CheckedQuizz4 = CheckedQuizz4,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("toujours"),
                        leading: Radio(  
                          value: CheckedQuizz4.always,
                          groupValue: CheckedQuizz4, 
                          onChanged: (CheckedQuizz4){
                            setState(() => {
                              CheckedQuizz4 = CheckedQuizz4,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("jamais"),
                        leading: Radio(  
                          value: CheckedQuizz4.never,
                          groupValue: CheckedQuizz4, 
                          onChanged: (CheckedQuizz4){
                            setState(() => {
                              CheckedQuizz4 = CheckedQuizz4,
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
                    child: Text( "Question 8", 
                     style: TextStyle(color: Colors.black),
                    ),
                  )
                  ),

                  ListTile (  
                        title: Text("parfois"),
                        leading: Radio(  
                          value: CheckedQuizz4.sometimes,
                          groupValue: CheckedQuizz4, 
                          onChanged: (CheckedQuizz4){
                            setState(() => {
                              CheckedQuizz4 = CheckedQuizz4,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("toujours"),
                        leading: Radio(  
                          value: CheckedQuizz4.always,
                          groupValue: CheckedQuizz4, 
                          onChanged: (CheckedQuizz4){
                            setState(() => {
                              CheckedQuizz4 = CheckedQuizz4,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("jamais"),
                        leading: Radio(  
                          value: CheckedQuizz4.never,
                          groupValue: CheckedQuizz4, 
                          onChanged: (CheckedQuizz4){
                            setState(() => {
                              CheckedQuizz4 = CheckedQuizz4,
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
                             MaterialPageRoute(builder: (context) => Quizz5()),
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



