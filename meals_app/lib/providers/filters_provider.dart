import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/mealsModel.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum FiltersApplied {
  glutenFree,
  lactoseFree,
  vegetarien,
  vegan
}

class FilterNotifier extends StateNotifier<Map<FiltersApplied,bool>>{
    FilterNotifier() : super({
        FiltersApplied.glutenFree : false,
        FiltersApplied.lactoseFree : false,
        FiltersApplied.vegetarien : false,
        FiltersApplied.vegan : false,
    }); 

    void setCompleteFilters(Map<FiltersApplied,bool> chosenFilters){
        state = chosenFilters;
    }

    void setFilters(FiltersApplied filter, bool isActive){
        state = {
            ...state,
            filter : isActive
        };
    }
}

final filtersProvider = StateNotifierProvider<FilterNotifier,Map<FiltersApplied,bool>>(
    (ref)=>FilterNotifier()
    );

final filteredMealsList = Provider<List<MealsModel>>(
    (ref){
        final filtersInProvider = ref.watch(filtersProvider);
        final mealsFromProvider = ref.watch(mealsProvider);
        return mealsFromProvider.where((meal){
      if(filtersInProvider[FiltersApplied.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(filtersInProvider[FiltersApplied.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(filtersInProvider[FiltersApplied.vegetarien]! && !meal.isVegetarian){
        return false;
      }
      if(filtersInProvider[FiltersApplied.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();
    }
);