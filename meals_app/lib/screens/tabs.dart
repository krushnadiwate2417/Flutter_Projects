

import 'package:flutter/material.dart';
import 'package:meals_app/models/mealsModel.dart';
import 'package:meals_app/screens/categories.dart';
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

  @override 
  Widget build(BuildContext context){
    Widget activeScreen = CategoriesScreen(onFavouriteMeal: _toggleMealFavorites,);
      String activeScreenTitle = "Categories";
      if(_selectedIndex == 1){
        activeScreen = MealsScreen( meals: favouritesList,onFavouriteMeal: _toggleMealFavorites,);
        activeScreenTitle = "Your Favorites";
      }

    return Scaffold(
      appBar:AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: DrawerMain(),
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