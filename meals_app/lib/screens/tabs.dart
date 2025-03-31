

import 'package:flutter/material.dart';
// import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';

 const kFilters = {
    FiltersApplied.glutenFree : false,
    FiltersApplied.lactoseFree : false,
            FiltersApplied.vegetarien : false,
            FiltersApplied.vegan : false,
  };

class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});

  @override 
  ConsumerState<TabsScreen> createState(){
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen>{
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
       await Navigator.of(context)
      .push<Map<FiltersApplied,bool>>(MaterialPageRoute(builder: (context)=>FilterScreen()));
    }
  }

  @override 
  Widget build(BuildContext context){

    Widget activeScreen =const CategoriesScreen();
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