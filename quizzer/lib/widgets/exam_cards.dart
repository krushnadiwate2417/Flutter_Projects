
import 'package:flutter/material.dart';

class ExamCards extends StatelessWidget{
  const ExamCards({super.key,required this.title, required this.type, required this.marks, required this.isRapid});

  final String title;
  final String type;
  final bool isRapid;
  final int marks;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          children: [
            Text(title, style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600,
              fontSize: 20
            ),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(type),
                Icon(isRapid ? Icons.flash_on : Icons.timelapse_rounded,color:isRapid ? Colors.amber:Colors.black,),
                Text('$marks M')
              ],
            )
          ],
        ),
        )
    );
  }
}