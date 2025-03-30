import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/mealsModel.dart';


class FavoritesProvider extends StateNotifier<List<MealsModel>>{
  FavoritesProvider() : super([]);

  bool favouriteFunction(MealsModel meal){
    final isFavourites = state.contains(meal);

    if(isFavourites){
      state = state.where((m)=>m.id != meal.id).toList();
      return false;
    }else{
      state = [...state,meal];
      return true;
    }
  }

}



final favouriteMealsProvider = StateNotifierProvider<FavoritesProvider,List<MealsModel>>((ref){
  return FavoritesProvider();
});
