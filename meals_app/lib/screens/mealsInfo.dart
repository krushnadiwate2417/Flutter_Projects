

import 'package:flutter/material.dart';
import 'package:meals_app/models/mealsModel.dart';
import 'package:meals_app/widgets/details_meals.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Mealsinfo extends ConsumerWidget{
  const Mealsinfo({super.key, required this.selectedMeal});

  final MealsModel selectedMeal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar:AppBar(
        title: Text(selectedMeal.title),
        actions: [
          IconButton(onPressed: (){
            final isAdded = ref.read(favouriteMealsProvider.notifier)
                .favouriteFunction(selectedMeal);

            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar
              (duration: Durations.long4,
              content: Text(isAdded ? 'Added To Favourites' : 'Removed From Favourites')));
          }, icon: Icon(Icons.star_border))
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
