import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();


class DiceRoll extends StatefulWidget{
  const DiceRoll({super.key});
  @override
  State<DiceRoll> createState(){
    return _DiceRollState();
  }
}

class _DiceRollState extends State<DiceRoll> {
  var currentDiceNumber = 1;

  void rollDice(){
    setState(() {
    currentDiceNumber = randomizer.nextInt(6) + 1;

    });
  }


  @override
  Widget build(context){
    return Column(mainAxisSize: MainAxisSize.min,children: [
          Image.asset('assets/images/dice-$currentDiceNumber.png',width: 200,),
          const SizedBox(height: 20,),
          TextButton(onPressed: rollDice,style: TextButton.styleFrom(
            // padding: EdgeInsets.only(top: 20),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)
          ), child: const Text("Roll the Dice !"))
        ],);
  }
}