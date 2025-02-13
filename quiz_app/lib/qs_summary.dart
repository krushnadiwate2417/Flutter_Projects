import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QsSummary extends StatelessWidget {
  const QsSummary(this.summaryData,{super.key});

  final List<Map<String,Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((ele){
            return Row(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(
                width: 20,
                child: Text(((ele['question_index'] as int) + 1).toString(),style: GoogleFonts.alice(color: Colors.white,fontSize: 20),),),
              Expanded(
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text((ele["question"]).toString(),style: GoogleFonts.alice(color: Colors.white,fontSize: 20)),
                  Text((ele["user_answer"]).toString(),style: GoogleFonts.alice(color: ele["user_answer"] == ele['correct_answer'] ? Colors.green : Colors.red,fontSize: 15)),
                  Text((ele['correct_answer']).toString(),style: GoogleFonts.alice(color: Colors.green,fontSize: 15))
                ],),
              ),
            ],);
          }).toList(),
          ),
      ),
    );
  }

}