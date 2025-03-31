

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersSwitch extends ConsumerWidget{
  const FiltersSwitch({
    super.key,
    required this.initValue,
    required this.filterWhichIsChosen,
    required this.titleString,
    });

  final bool initValue;
  final FiltersApplied filterWhichIsChosen;
  final String titleString;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
            value: initValue, 
            onChanged: (isChecked){
              ref.watch(filtersProvider.notifier).setFilters(filterWhichIsChosen, isChecked);
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