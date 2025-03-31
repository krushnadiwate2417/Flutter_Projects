

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

    final favouriteMealsFromProvider = ref.watch(favouriteMealsProvider);
    final isInFavourite = favouriteMealsFromProvider.contains(selectedMeal);
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
          }, icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child,animation){
              return RotationTransition(turns: Tween<double>(begin:0.8,end: 1 ).animate(animation),child: child,);
            },
            child: isInFavourite?Icon(Icons.star,color: Colors.yellow,key: ValueKey(isInFavourite),):Icon(Icons.star_border,key: ValueKey(isInFavourite)),
          ))
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children : [
            Hero(tag: selectedMeal.id,
              child: Image.network(selectedMeal.imageUrl,height: 300,width: double.infinity,)),
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
