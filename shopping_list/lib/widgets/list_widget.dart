

import 'package:flutter/material.dart';
import 'package:shopping_list/models/category.dart';

class ListWidget extends StatelessWidget{
  const ListWidget({
  super.key, 
  required this.typeColor,
  required this.title, 
  required this.quantityNumber
  });

  final Category typeColor;
  final String title;
  final int quantityNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.square,color: typeColor.color,),
          Text(title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.secondary
          ),),
          Text('$quantityNumber')
        ],
      ),
    );
  }
}