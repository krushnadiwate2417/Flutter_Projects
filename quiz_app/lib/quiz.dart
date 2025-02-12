import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quizz extends StatefulWidget {
  const Quizz({super.key});
  @override
  State<Quizz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quizz>{

  var activeScreen = 'start_screen';

  void switchScreen(){
    setState(() {
      activeScreen = 'questions_screen';
    });
  } 
  @override 
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'questions_screen'){
      screenWidget = Questions();
    }

     return MaterialApp(
            home: Scaffold(
                body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 2, 103, 186), Color.fromARGB(255, 39, 150, 240)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                  )
                ),
                child: screenWidget),
            ),
        );
  }
}