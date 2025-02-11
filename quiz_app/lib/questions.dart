import 'package:flutter/material.dart';

class Questions extends StatefulWidget{
  Questions({super.key});

  State<Questions> createState(){
    return _FlutterQuestions();
  }
}

class _FlutterQuestions extends State<Questions>{
  @override
  Widget build(context){
    return Text("This is Questions Screen");
  }
}