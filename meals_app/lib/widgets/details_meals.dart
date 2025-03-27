

import 'package:flutter/material.dart';

class DetailsMeals extends StatelessWidget{
  const DetailsMeals({super.key, required this.list, required this.titleDetail,});
  
  final List list;
  final String titleDetail;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(titleDetail,style : Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            )),
            const SizedBox(height: 7,),
            for (final ele in list)
              Text('${list.indexOf(ele)+1}) $ele',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary
              ),textAlign: TextAlign.center,),
      ],
    );
  }
}