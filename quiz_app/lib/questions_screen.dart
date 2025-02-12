import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/answer_button.dart';


class Questions extends StatefulWidget{
  Questions({super.key});

  State<Questions> createState(){
    return _FlutterQuestions();
  }
}

final currentQuestion = questions[0];

class _FlutterQuestions extends State<Questions>{
  @override
  Widget build(context){
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(currentQuestion.question,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),),
          
          SizedBox(height: 20,),

          ...currentQuestion.answers.map((answer){
            return AnswerButton(answerText: answer, onSelectFunc: (){});
          })
        ],
      ),
      )
    );
  }
}