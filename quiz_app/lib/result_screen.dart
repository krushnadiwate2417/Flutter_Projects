import "package:flutter/material.dart";
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget{
 ResultScreen({super.key,required this.onRestart, required this.chosenAnswers});

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
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is Result Screen"),
            TextButton.icon(
              onPressed: onRestart, 
              icon: Icon(Icons.restart_alt,color: Colors.white,)
            ,label: Text("Restart Quiz"))
          ],
        ),
      ), 
    );
  }

}