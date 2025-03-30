import "package:flutter/material.dart";
import "package:meals_app/models/mealsModel.dart";
import "package:meals_app/screens/mealsInfo.dart";
import "package:meals_app/widgets/meals_card.dart";


class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key, this.title, required this.meals,});

  final String? title;
  final List<MealsModel> meals;

  void _selectedMeal(BuildContext context, MealsModel mealTapped){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context)=>Mealsinfo(selectedMeal: mealTapped,)
          )
        );
  }


  @override
  Widget build(BuildContext context){
      Widget content =  ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx,index)=>MealsCard(meal: meals[index],selectedMeal: (meals){
          _selectedMeal(context, meals);
        },));

      if(meals.isEmpty){
        content = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Nothing Here",style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              )),
              SizedBox(height: 20,),
              Text("Try Selecting Other Category",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              ),
            ],
          ),
        );
      }

      if(title == null){
        return content;
      }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body:content,
    );
  }
}

