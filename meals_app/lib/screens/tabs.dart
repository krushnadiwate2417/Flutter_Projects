

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/mealsModel.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});

  @override 
  ConsumerState<TabsScreen> createState(){
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen>{

 Map<FiltersApplied,bool> _selectedFilters = {
    FiltersApplied.glutenFree : false,
            FiltersApplied.lactoseFree : false,
            FiltersApplied.vegetarien : false,
            FiltersApplied.vegan : false,
  };

  int _selectedIndex = 0;
  void _setScreen(int index){
    setState(() {
      _selectedIndex = index;
    });
  }    

  // final List<MealsModel> favouritesList = [];
  // void _toggleMealFavorites(MealsModel meal){
  
  //   setState(() {
  //       final isExisting = favouritesList.contains(meal);
  //   if(isExisting){
  //     favouritesList.remove(meal);
  //     _showMsg("Removed from Favourites");
  //   }else{
  //     favouritesList.add(meal);
  //     _showMsg("Added to Favourites");
  //   }
  //   });
  // }


  void  _selectdDrawer(String identifier)async{
    Navigator.of(context).pop();
    if(identifier == 'filter'){
      final result = await Navigator.of(context)
                    .push<Map<FiltersApplied,bool>>(MaterialPageRoute(builder: (context)=>FilterScreen(currentFilters: _selectedFilters,)));
      setState((){
        _selectedFilters = result ?? _selectedFilters;
      });
    }
  }

  @override 
  Widget build(BuildContext context){
    final mealsFromProvider = ref.watch(mealsProvider);
    final availableMeals = mealsFromProvider.where((meal){
      if(_selectedFilters[FiltersApplied.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilters[FiltersApplied.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[FiltersApplied.vegetarien]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedFilters[FiltersApplied.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();




    Widget activeScreen = CategoriesScreen(availableMeals: availableMeals,);
      String activeScreenTitle = "Categories";
      if(_selectedIndex == 1){
        final favouriteMeals = ref.watch(favouriteMealsProvider);

        activeScreen = MealsScreen( meals: favouriteMeals,);
        activeScreenTitle = "Your Favorites";
      }

    return Scaffold(
      appBar:AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: DrawerMain(onSelectedDrawer: _selectdDrawer,),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          _setScreen(index);
        },
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star_border_outlined),label: 'Favorites'),
      ]),
    );
  }
}