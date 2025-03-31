import 'package:flutter/material.dart';
import 'package:meals_app/widgets/mealsMetaData.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/models/mealsModel.dart';

class MealsCard extends StatelessWidget {
  const MealsCard({super.key, required this.meal, required this.selectedMeal});

  
  final MealsModel meal;
  final void Function(MealsModel meal) selectedMeal;

  String get complexity {
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }
  String get affordability {
    return meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: (){selectedMeal(meal);},
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(placeholder: MemoryImage(kTransparentImage),
               image: NetworkImage(meal.imageUrl),
               height: 200,
               width: double.infinity,
               fit: BoxFit.cover,
               ),
            ),
             Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child:Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                child: Column(
                  children: [
                    Text(
                    meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Mealsmetadata(icon: Icons.timer, label: '${meal.duration} min'),
                        SizedBox(width: 20,),
                        Mealsmetadata(icon: Icons.timeline_rounded, label: complexity),
                        SizedBox(width: 20,),
                        Mealsmetadata(icon: Icons.attach_money_rounded, label: affordability),
                      ],
                    )
                  ],
                ),
              ) )
          ],
        ),
      ),
    );
  }


}