
import "package:flutter/material.dart";
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/qs_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key,required this.onRestart, required this.chosenAnswers});

  final void Function() onRestart;
  final List<String> chosenAnswers;


  List<Map<String, Object>> getSumaaryData(){
    
    final List<Map<String, Object>> summary = [];

    for(var i = 0;i<chosenAnswers.length;i++){
      summary.add({
        'question_index':i,
        "question" : questions[i].question,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : chosenAnswers[i]
      });
    }
  return summary;
  }

  @override 
  Widget build(context){
    final summary = getSumaaryData();
    final correctAnswers = summary.where((data){
      return data['user_answer'] == data['correct_answer'];
    });

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You Answered ${correctAnswers.length} Questions Correctly out of ${questions.length} Questions",
              style: GoogleFonts.alice(color: const Color.fromARGB(185, 255, 255, 255),fontSize: 23)
              ),
            SizedBox(height: 30,),
            QsSummary(summary),
            SizedBox(height: 30,),
            TextButton.icon(
              onPressed: onRestart, 
              icon: Icon(Icons.restart_alt,color: Colors.white,)
            ,label: Text("Restart Quiz",style: GoogleFonts.alice(color: Colors.white,fontSize: 20)))
          ],
        ),
      ), 
    );
  }

}