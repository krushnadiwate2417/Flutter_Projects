


import 'package:flutter/material.dart';
import 'package:quizzer/widgets/grid_cards.dart';

class ExamCategory extends StatelessWidget{

   ExamCategory({super.key});
  final examCat = ["Quatitative","Analytical","Logical","Verbal","Non-Verbal","Coding","Coumpter-Fundamentals"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 3/2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(15),
      itemCount: examCat.length,
      itemBuilder: (context, index) {
        return GridCards(examCategory: examCat[index]);
      }
      );
  }
}