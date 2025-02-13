import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return 
      Center(
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png',width: 300,color: const Color.fromARGB(150, 255, 255, 255)),

            const SizedBox(height: 80,),

            Text("Learn Flutter the Fun Way!",
            style: GoogleFonts.alice(
              color: Colors.white,
              fontSize: 28,fontWeight: 
              FontWeight.w300)),

            const SizedBox(height: 40,),

            OutlinedButton.icon(onPressed: startQuiz, 
              style: OutlinedButton.styleFrom(
                shape: const BeveledRectangleBorder(),
                side: BorderSide(color: Colors.white,width: 0.5),
                foregroundColor: Colors.white
                ),
              icon: Icon(Icons.arrow_right_alt,color: Colors.white,),
              label: Text(
              "Start Quiz",style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20
              ),
              
            ),
            )],
        )
      );
  }

}