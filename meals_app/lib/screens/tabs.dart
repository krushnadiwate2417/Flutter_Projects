

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/mealsModel.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/drawer.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});

  @override 
  State<TabsScreen> createState(){
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen>{

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

  void _showMsg(String msg){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Durations.long4,content: Text(msg)));
  }

  final List<MealsModel> favouritesList = [];
  void _toggleMealFavorites(MealsModel meal){
  
    setState(() {
        final isExisting = favouritesList.contains(meal);
    if(isExisting){
      favouritesList.remove(meal);
      _showMsg("Removed from Favourites");
    }else{
      favouritesList.add(meal);
      _showMsg("Added to Favourites");
    }
    });
  }


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
    final availableMeals = dummyMeals.where((meal){
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




    Widget activeScreen = CategoriesScreen(onFavouriteMeal: _toggleMealFavorites,availableMeals: availableMeals,);
      String activeScreenTitle = "Categories";
      if(_selectedIndex == 1){
        activeScreen = MealsScreen( meals: favouritesList,onFavouriteMeal: _toggleMealFavorites,);
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