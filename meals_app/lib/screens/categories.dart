
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/categoryModel.dart';
import 'package:meals_app/models/mealsModel.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key,required this.onFavouriteMeal});
  final void Function(MealsModel meal) onFavouriteMeal;

  void _selectCategory(BuildContext context, CategoryModel category){

    final filteredList = dummyMeals.where(
      (meal)=>meal.categories.contains(category.id)).toList();


    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx)=>MealsScreen(title: category.title, meals: filteredList,onFavouriteMeal: onFavouriteMeal,)
      )
    );
  }

  @override
  Widget build(BuildContext context){
    return GridView(
        padding:const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          ),
        children: [
          for (final category in availableCategories)
            CategoryGrid(category: category,selectedCat: _selectCategory,)
        ],
        );
  }
}