

import 'package:flutter/material.dart';
import 'package:quizzer/widgets/exam_cards.dart';
import 'package:quizzer/widgets/exam_category.dart';

class HomeScreen extends StatelessWidget{ 
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("On Going Exams : ",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              ),
              ExamCards(title: "Exam 1",isRapid: true,marks: 10,type: "MCQ",),
              const SizedBox(height: 10,),
              ExamCards(title: "Exam 2",isRapid: true,marks: 10,type: "MCQ"),
              const SizedBox(height: 10,),
              ExamCards(title: "Exam 3",isRapid: false,marks: 10,type: "Coding"),
              const SizedBox(height: 10,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Categories : ",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              ),
               ExamCategory()
            ],
          ),
      );
  }
}