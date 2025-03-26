import "package:meals_app/models/categoryModel.dart";
import "package:flutter/material.dart";

class CategoryGrid extends StatelessWidget{
  const CategoryGrid({super.key, required this.category, required this.selectedCat});

  final CategoryModel category;
  final Function selectedCat;

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: (){selectedCat(context,category);},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding:const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors:[category.color.withValues(alpha: 0.55),
                    category.color.withValues(alpha: 0.9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            )
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer
          ),
      
        ),
      ),
    );
  }

}