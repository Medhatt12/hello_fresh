import 'ingredient_model.dart';

class Meal{
  String mealName;
  String mealDescription;
  int calories;
  bool isVegan;
  List<Ingredient> mealIngredients;
  String imageURL;

  Meal(this.mealName,this.mealDescription,this.calories,this.isVegan,this.mealIngredients,this.imageURL);
}