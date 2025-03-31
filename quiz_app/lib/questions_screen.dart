import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget{
  const Questions({super.key,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<Questions> createState(){
    return _FlutterQuestions();
  }
}


class _FlutterQuestions extends State<Questions>{

  var currentQuestionIndex = 0;

  void afterAnswerSelected(String answer){
    widget.onSelectAnswer(answer);
    setState(() {
        currentQuestionIndex++;
     
    });
  }

  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(currentQuestion.question,
          textAlign: TextAlign.center,
          style: GoogleFonts.alice(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          
          SizedBox(height: 20,),

          ...currentQuestion.getShuffledList().map((answer){
            return AnswerButton(answerText: answer, onSelectFunc: (){
              afterAnswerSelected(answer);
            });
          })
        ],
      ),
      )
    );
  }
}