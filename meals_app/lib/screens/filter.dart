

import 'package:flutter/material.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/drawer.dart';
import 'package:meals_app/widgets/filters_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';


class FilterScreen extends ConsumerWidget{
   FilterScreen({super.key});
   final ValueNotifier<int> counter = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context,WidgetRef ref) {

      final Map<FiltersApplied, bool> filterInProvider = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(onPressed: (){
            filterInProvider[FiltersApplied.glutenFree] = false;
            filterInProvider[FiltersApplied.lactoseFree] = false;
            filterInProvider[FiltersApplied.vegetarien] = false;
            filterInProvider[FiltersApplied.vegan] = false;
            counter.value++;
          }, icon: Icon(Icons.restart_alt_rounded))
        ],
      ),
      // drawer: DrawerMain(onSelectedDrawer: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == 'meals'){
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
      //       TabsScreen()
      //     ));
      //   }
      // }),
      body: ValueListenableBuilder(
        valueListenable: counter, 
        builder: (ctx,value,child){
          return Column(
          children: [
            FiltersSwitch(initValue: filterInProvider[FiltersApplied.glutenFree]!, filterWhichIsChosen: FiltersApplied.glutenFree, titleString: "Gluten-Free",),
            FiltersSwitch(initValue: filterInProvider[FiltersApplied.lactoseFree]!, filterWhichIsChosen: FiltersApplied.lactoseFree, titleString: "Lactose-Free",),
            FiltersSwitch(initValue: filterInProvider[FiltersApplied.vegetarien]!, filterWhichIsChosen: FiltersApplied.vegetarien, titleString: "Vegitarien", ),
            FiltersSwitch(initValue: filterInProvider[FiltersApplied.vegan]!, filterWhichIsChosen: FiltersApplied.vegan, titleString: "Vegan",)
          ],
        );
        }
        )
      );
  }
}