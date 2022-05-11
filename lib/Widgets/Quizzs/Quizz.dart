
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:link_text/link_text.dart';
import 'Quizz2.dart';



class Quizz extends StatefulWidget {
  State<Quizz> createState() => _Quizz();
}

enum CheckedQuizz {sometimes, always, never}
CheckedQuizz sometimes = CheckedQuizz.sometimes;
CheckedQuizz always = CheckedQuizz.always;
CheckedQuizz never = CheckedQuizz.never;

class _Quizz extends  State<Quizz> {
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
                    child: Text( "Question 1", 
                     style: TextStyle(color: Colors.black),
                    ),
                  )
                  ),

                  ListTile (  
                        title: Text("parfois"),
                        leading: Radio(  
                          value: CheckedQuizz.sometimes,
                          groupValue: CheckedQuizz, 
                          onChanged: (CheckedQuizz){
                            setState(() => {
                              CheckedQuizz = CheckedQuizz,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("toujours"),
                        leading: Radio(  
                          value: CheckedQuizz.always,
                          groupValue: CheckedQuizz, 
                          onChanged: (CheckedQuizz){
                            setState(() => {
                              CheckedQuizz = CheckedQuizz,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("jamais"),
                        leading: Radio(  
                          value: CheckedQuizz.never,
                          groupValue: CheckedQuizz, 
                          onChanged: (CheckedQuizz){
                            setState(() => {
                              CheckedQuizz = CheckedQuizz,
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
                    child: Text( "Question 2", 
                     style: TextStyle(color: Colors.black),
                    ),
                  )
                  ),

                  ListTile (  
                        title: Text("parfois"),
                        leading: Radio(  
                          value: CheckedQuizz.sometimes,
                          groupValue: CheckedQuizz, 
                          onChanged: (CheckedQuizz){
                            setState(() => {
                              CheckedQuizz = CheckedQuizz,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("toujours"),
                        leading: Radio(  
                          value: CheckedQuizz.always,
                          groupValue: CheckedQuizz, 
                          onChanged: (CheckedQuizz){
                            setState(() => {
                              CheckedQuizz = CheckedQuizz,
                            });
                          }
                          
                        ),
                      ),

                      ListTile (  
                        title: Text("jamais"),
                        leading: Radio(  
                          value: CheckedQuizz.never,
                          groupValue: CheckedQuizz, 
                          onChanged: (CheckedQuizz){
                            setState(() => {
                              CheckedQuizz = CheckedQuizz,
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
                             MaterialPageRoute(builder: (context) => Quizz2()),
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




