

import 'package:flutter/material.dart';
import 'package:meals_app/models/mealsModel.dart';
import 'package:meals_app/widgets/details_meals.dart';

class Mealsinfo extends StatelessWidget{
  const Mealsinfo({super.key, required this.selectedMeal,required this.onFavouriteMeal});

  final MealsModel selectedMeal;
  final void Function(MealsModel meal) onFavouriteMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(selectedMeal.title),
        actions: [
          IconButton(onPressed: (){onFavouriteMeal(selectedMeal);}, icon: Icon(Icons.star_border))
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children : [
            Image.network(selectedMeal.imageUrl,height: 300,width: double.infinity,),
            const SizedBox(height : 15),
            DetailsMeals(list: selectedMeal.ingredients, titleDetail: "Ingredients"),
            const SizedBox(height: 15,),
            DetailsMeals(list: selectedMeal.steps, titleDetail: "Step")
          ]
        ),
      )
      );
  }

}
