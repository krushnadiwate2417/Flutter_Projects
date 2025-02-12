import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key,required this.answerText,required this.onSelectFunc});

  final String answerText;
  final void Function() onSelectFunc;

  @override 
  Widget build(context){
    return ElevatedButton(
      onPressed: onSelectFunc, 
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 2, 60, 161),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40)
      
      ),
      child: Text(answerText));
  }
}