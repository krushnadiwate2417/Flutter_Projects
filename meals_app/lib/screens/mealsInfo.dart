

import 'package:flutter/material.dart';
import 'package:meals_app/models/mealsModel.dart';

class Mealsinfo extends StatelessWidget{
  const Mealsinfo({super.key, required this.selectedMeal});

  final MealsModel selectedMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(selectedMeal.title),
      ),
      body:  Image.network(selectedMeal.imageUrl,height: 300,width: double.infinity,)
      );
  }

}
