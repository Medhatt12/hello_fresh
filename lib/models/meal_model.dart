import 'package:flutter/foundation.dart';


class Meal with ChangeNotifier{
  final String id;
  final String mealName;
  final String mealDescription;
  final int calories;
  final bool isVegan;
  //final List<Ingredient> mealIngredients;
  final List<String> mealIngredients;
  final String imageURL;
  final int cookingTime;
  bool isChoosen;

  Meal(
      {@required this.id,
      @required this.mealName,
      @required this.mealDescription,
      @required this.calories,
      @required this.isVegan,
      @required this.mealIngredients,
      @required this.imageURL,
      @required this.cookingTime,
      this.isChoosen = false});

  void toggleFavoriteStatue(){
    isChoosen =!isChoosen;
    notifyListeners();
  }
  bool get choosenVal{
    return isChoosen;
  }
}
