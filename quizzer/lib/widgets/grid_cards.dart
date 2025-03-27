


import 'package:flutter/material.dart';

class GridCards extends StatelessWidget{
  const GridCards({super.key,required this.examCategory});

  final String examCategory;

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, const Color.fromARGB(255, 86, 31, 234)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            )
        ),
        child: Center(
          child: Text(examCategory,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
            color: Colors.white
          ),),
        ),
      );

  }
}