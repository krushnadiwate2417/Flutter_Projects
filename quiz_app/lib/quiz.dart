import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

class Quizz extends StatefulWidget {
  const Quizz({super.key});
  @override
  State<Quizz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quizz>{

  var activeScreen = 'start_screen';
   List<String> selectedAnswers = [];

  void switchScreen(){
    setState(() {
      activeScreen = 'questions_screen';
    });
  } 

  void answerSelection(answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = "result_screen";
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions_screen';
    });
  }

  @override 
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'questions_screen'){
      screenWidget = Questions(onSelectAnswer: answerSelection,);
    }

    if(activeScreen == 'result_screen'){
      screenWidget = ResultScreen(onRestart: restartQuiz,chosenAnswers: selectedAnswers,);
    }

     return MaterialApp(
            home: Scaffold(
                body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 15, 1, 105), Color.fromARGB(255, 1, 15, 105)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                  )
                ),
                child: screenWidget),
            ),
        );
  }
}