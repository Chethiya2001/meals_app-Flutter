import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoritesMEalNotifier extends StateNotifier<List<Meal>> {
  FavoritesMEalNotifier() : super([]);

  bool toggleMealFavStatus(Meal meal){
    final mealsFav = state.contains(meal);

    if (mealsFav) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }else{
      state = [...state, meal];
     return true;
    }
  
  }
}

final favoritesMEalProvider = StateNotifierProvider<FavoritesMEalNotifier,List<Meal>>((ref) {
  return FavoritesMEalNotifier();
});