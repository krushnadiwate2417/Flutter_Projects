
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/categoryModel.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid.dart';

class CategoriesScreen extends ConsumerStatefulWidget{
  const CategoriesScreen({super.key});


  @override
  ConsumerState<CategoriesScreen> createState() {
    return _CategoriesState();
  }
}

class _CategoriesState extends ConsumerState<CategoriesScreen> with SingleTickerProviderStateMixin{

  late AnimationController _animateCategories;

  @override
  void initState() {
    super.initState();

    _animateCategories = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animateCategories.forward();
  }

  @override
  void dispose() {
    _animateCategories.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
  void selectCategory(BuildContext context, CategoryModel category){

    final filteredList = ref.watch(filteredMealsList).where(
      (meal)=>meal.categories.contains(category.id)).toList();


    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx)=>MealsScreen(title: category.title, meals: filteredList,)
      )
    );
  }

    return AnimatedBuilder(
      animation: _animateCategories, 
      child: GridView(
        padding:const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          ),
        children: [
          for (final category in availableCategories)
            CategoryGrid(category: category,selectedCat: selectCategory,)
        ],
        ),
    builder: (context,child)=>SlideTransition(
      position:Tween(
          begin: const Offset(0, 0.35),
          end: const Offset(0, 0)
        ).animate(CurvedAnimation(parent: _animateCategories, curve: Curves.easeInOut)),
      child: child,
      ));
  }
}