import 'package:flutter/material.dart';
import 'package:minderbrain/Widgets/Quizzs/constants.dart';
import 'package:minderbrain/Widgets/Quizzs/widgets/question_widget.dart';
import '../models/question_model.dart';
import 'package:minderbrain/Widgets/Quizzs/widgets/next_button.dart';
import 'package:minderbrain/Widgets/Quizzs/widgets/option_card.dart';
import 'package:minderbrain/Widgets/Quizzs/widgets/result_box.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override 
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Question> _questions = [
    Question(  
      id: '10',
      title: 'Avez-vous du mal à vous rappelez de vos taches journaliéres ?',
      options: {'oui': false, 'non': true},
    ), 
    Question(  
      id: '11',
      title: 'Avez-vous du mal à vous concentrez lorsque vous regardez la télévision, jouez sur votre téléphone/tablette ou écoutez de la musique ?',
     options: {'oui': false, 'non': true},
    ),
    Question(  
      id: '12',
      title: 'Oubliez-vous les noms d\'objets familiers et utilisez-vous des expressions générales telles que « tu vois ce que je veux dire » ou « cette chose » ?',
      options: {'oui': false, 'non': true},
    ), 
    Question(  
      id: '13',
      title: 'Êtes-vous facilement confus en conduisant ou en utilisant des outils ? Vous perdez-vous dans des endroits qui vous sont familiers ?',
      options: {'oui': false, 'non': true},
    ), 
    Question(  
      id: '14',
      title: 'Avez-vous besoin d\'aide pour vous habiller, vous souvenir de prendre vos médicaments et/ou gérer vos finances ? ',
      options: {'oui': false, 'non': true},
    ), 
    Question(  
      id: '15',
      title: 'Ces difficultés reflètent-elles des changements par rapport à votre façon de se souvenir il y a quelques années ?',
      options: {'oui': false, 'non': true},
    ), 
    Question(  
      id: '16',
      title: 'Vous confondez-vous avec le rappel du jour de la semaine, du mois, de l\'année, des dates importantes et/ou des rendez-vous ?',
      options: {'oui': false, 'non': true},
    ), 
    Question(  
      id: '17',
      title: 'Trouvez vous que vous comprenez pas ce que les autres disent, à rire à des moments inappropriés ?',
      options: {'oui': false, 'non': true},
    ), 
  ];

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  void nextQuestion(){
    if(index == _questions.length - 1) {
      showDialog(context: context, builder: (ctx) => ResultBox(
        result: score,
        questionLength:  _questions.length,
      ));
    } else {
      if(isPressed) {
        setState(() {
        index++; 
        isPressed = false;
        isAlreadySelected = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar( 
        SnackBar(content: Text('Please select any option'), behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
    }

    };
  }

  /*void changeColor() {
    setState(() {
      isPressed = true;
    });
  }*/
  
  void checkAnswerAndUpdate(bool value) {
    if(isAlreadySelected) {
      true;
    } else  {
      if(value == true) {
        score = score + 10;
        setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    } else if (value == false) {
      score = score + 5;
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
    }
    
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( 
        backgroundColor: background, 
        title: Text('QuizHunter App'),
        shadowColor: Colors.transparent,
        actions: [
          Padding(padding: EdgeInsets.all(18.0), child: Text('Score: $score', 
          style: TextStyle(fontSize: 18.0),
          ),),
        ],
      ), 
      body: Container( 
        width: double.infinity, 
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(  
          children: [ 
            QuestionWidget(
              indexAction: index,
              question: _questions[index].title,
              totalQuestions: _questions.length
            ), 

            Divider(color: background,),

            SizedBox(height: 25.0),
            for(int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(_questions[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  //color: isPressed ? _questions[index].options.values.toList()[i] == true ? correct : incorrect: Colors.white, 
                  color: isPressed ? correct : Colors.white
                  
                  ),
              ),
            

            /*Container(child: Column(children: _questions.map((question) => Text(question.options.keys.toString(), 
                  
            ), 
            
            ).toList(),))*/ 
          ],
        )
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}