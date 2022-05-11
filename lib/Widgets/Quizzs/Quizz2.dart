
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'Quizz3.dart';


class Quizz2 extends StatefulWidget {
  State<Quizz2> createState() => _Quizz2();
}

enum CheckedQuizz2 {sometimes, always, never}
CheckedQuizz2 sometimes2 = CheckedQuizz2.sometimes;
CheckedQuizz2 always2 = CheckedQuizz2.always;
CheckedQuizz2 never2 = CheckedQuizz2.never;

class _Quizz2 extends  State<Quizz2> {
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
                    child: Text( "Question 3", 
                     style: TextStyle(color: Colors.black),
                    ),
                  )
                  ),

                  ListTile (  
                        title: Text("parfois"),
                        leading: Radio(  
                          value: CheckedQuizz2.sometimes,
                          groupValue: CheckedQuizz2, 
                          onChanged: (CheckedQuizz2){
                            setState(() => {
                              CheckedQuizz2 = CheckedQuizz2,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("toujours"),
                        leading: Radio(  
                          value: CheckedQuizz2.always,
                          groupValue: CheckedQuizz2, 
                          onChanged: (CheckedQuizz2){
                            setState(() => {
                              CheckedQuizz2 = CheckedQuizz2,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("jamais"),
                        leading: Radio(  
                          value: CheckedQuizz2.never,
                          groupValue: CheckedQuizz2, 
                          onChanged: (CheckedQuizz2){
                            setState(() => {
                              CheckedQuizz2 = CheckedQuizz2,
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
                    child: Text( "Question 4", 
                     style: TextStyle(color: Colors.black),
                    ),
                  )
                  ),

                  ListTile (  
                        title: Text("parfois"),
                        leading: Radio(  
                          value: CheckedQuizz2.sometimes,
                          groupValue: CheckedQuizz2, 
                          onChanged: (CheckedQuizz2){
                            setState(() => {
                              CheckedQuizz2 = CheckedQuizz2,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("toujours"),
                        leading: Radio(  
                          value: CheckedQuizz2.always,
                          groupValue: CheckedQuizz2, 
                          onChanged: (CheckedQuizz2){
                            setState(() => {
                              CheckedQuizz2 = CheckedQuizz2,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("jamais"),
                        leading: Radio(  
                          value: CheckedQuizz2.never,
                          groupValue: CheckedQuizz2, 
                          onChanged: (CheckedQuizz2){
                            setState(() => {
                              CheckedQuizz2 = CheckedQuizz2,
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
                             MaterialPageRoute(builder: (context) => Quizz3()),
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


