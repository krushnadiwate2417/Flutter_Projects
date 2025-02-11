import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions.dart';

class Quizz extends StatefulWidget {
  Quizz({super.key});
  @override
  State<Quizz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quizz>{

  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen(){
    setState(() {
      activeScreen = Questions();
    });
  } 


  @override 
  Widget build(context){
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
                child: activeScreen),
            ),
        );
  }
}