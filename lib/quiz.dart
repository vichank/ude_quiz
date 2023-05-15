
import 'package:flutter/material.dart';
import 'package:ude_quiz/questions_screen.dart';
import 'package:ude_quiz/start_screen.dart';
import 'package:ude_quiz/results_screen.dart';

import 'data/questions.dart';




class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class  _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';

    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  

    if (selectedAnswers.length == questions.length) {
      setState(() {
       selectedAnswers = [];
       activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget =  StartScreen(switchScreen);
    
    if (activeScreen == 'questions-screen') {
        screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }

     //if (activeScreen == 'results-screen') {
      //  screenWidget = ResultsScreen(chooseAnswer: selectedAnswers,);
    //}
    

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const 
               BoxDecoration(
                             gradient: LinearGradient(
                              colors: [Color.fromARGB(255, 243, 5, 211),
                                      Color.fromARGB(255, 240, 159, 243)
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
