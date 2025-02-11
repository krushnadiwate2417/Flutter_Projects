import 'package:flutter/material.dart';
import 'package:first/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: GradientContainer(
          Color.fromARGB(255, 193, 7, 255),
           Color.fromARGB(255, 7, 65, 255)
        )),
    ),
  );
}


