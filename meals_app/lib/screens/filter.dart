

import 'package:flutter/material.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/drawer.dart';
import 'package:meals_app/widgets/filters_switch.dart';


enum FiltersApplied {
  glutenFree,
  lactoseFree,
  vegetarien,
  vegan
}

class FilterScreen extends StatefulWidget{
  FilterScreen({super.key,required this.currentFilters});


  final Map<FiltersApplied,bool> currentFilters;
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen>{

  var _glutenFreeSet = false;
  void _glutenFreeSetFunc(bool checkVal){
    setState(() {
      _glutenFreeSet = checkVal;
    });
  }


  var _lactoseFreeSet = false;
  void _lactoseFreeSetFunc(bool checkVal){
    setState(() {
      _lactoseFreeSet = checkVal;
    });
  }


  var _vegetarienSet = false;
  void __vegetarienSetFunc(bool checkVal){
    setState(() {
      _vegetarienSet = checkVal;
    });
  }


  var _veganSet = false;
  void _veganSetFunc(bool checkVal){
    setState(() {
      _veganSet = checkVal;
    });
  }

  @override
  void initState() {
    super.initState();
    _glutenFreeSet = widget.currentFilters[FiltersApplied.glutenFree]!;
    _lactoseFreeSet = widget.currentFilters[FiltersApplied.lactoseFree]!;
    _vegetarienSet = widget.currentFilters[FiltersApplied.vegetarien]!;
    _veganSet = widget.currentFilters[FiltersApplied.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              _glutenFreeSet = false;
              _lactoseFreeSet = false;
              _vegetarienSet = false;
              _veganSet = false;
            });
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
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult:(bool didPop,dynamic result) {
          if(didPop) return;
          Navigator.of(context).pop({
            FiltersApplied.glutenFree : _glutenFreeSet,
            FiltersApplied.lactoseFree : _lactoseFreeSet,
            FiltersApplied.vegetarien : _vegetarienSet,
            FiltersApplied.vegan : _veganSet,
          });
        } ,
        child: Column(
          children: [
            FiltersSwitch(initValue: _glutenFreeSet, onChecked: _glutenFreeSetFunc, titleString: "Gluten-Free",),
            FiltersSwitch(initValue: _lactoseFreeSet, onChecked: _lactoseFreeSetFunc, titleString: "Lactose-Free",),
            FiltersSwitch(initValue: _vegetarienSet, onChecked: __vegetarienSetFunc, titleString: "Vegitarien", ),
            FiltersSwitch(initValue: _veganSet, onChecked: _veganSetFunc, titleString: "Vegan",)
          ],
        ),
      ),
      );
  }
}