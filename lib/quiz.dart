
import 'package:flutter/material.dart';
import 'package:ude_quiz/questions_screen.dart';
import 'package:ude_quiz/start_screen.dart';




class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class  _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';

    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }
  
  @override
  Widget build(BuildContext context) {

    Widget screenWidget =  StartScreen(switchScreen);
    
    if (activeScreen == 'questions-screen') {
        screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }
    

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const 
               BoxDecoration(
                             gradient: LinearGradient(
                              colors: [Color.fromARGB(255, 40, 9, 94),
                                      Color.fromARGB(255, 175, 10, 204)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight
                                      ),
                                    ),
          child: screenWidget,
          ),
        ),
      );
  }
}
