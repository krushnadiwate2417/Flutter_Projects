

import 'package:flutter/material.dart';

class FiltersSwitch extends StatelessWidget{
  const FiltersSwitch({
    super.key,
    required this.initValue,
    required this.onChecked,
    required this.titleString,
    });

  final bool initValue;
  final Function(bool checkValue) onChecked;
  final String titleString;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
            value: initValue, 
            onChanged: (isChecked){
              onChecked(isChecked);
            },
            title: Text(titleString,style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary
            ),),
            subtitle: Text('Select to Apply $titleString Filter',style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary
            ),),
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),
      );
  }
}