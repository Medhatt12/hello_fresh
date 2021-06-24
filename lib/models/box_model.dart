import 'package:hello_fresh/models/user_model.dart';

import 'ingredient_model.dart';
import 'meal_model.dart';

class BoxOfMeals {
  List<Meal> boxMeals;
  DateTime deliveryTime;
  bool isVegan;

  BoxOfMeals(
    this.boxMeals,
    this.deliveryTime,
    this.isVegan,
  );

  DateTime findLastEditDate(){
    DateTime lastTimeToEdit = deliveryTime.subtract(const Duration(days: 4));
    return lastTimeToEdit;
  }
}
  
  Ingredient chicken= Ingredient('Chicken', 250.0);
  Ingredient rice= new Ingredient('rice', 150.0);
  Ingredient pesto=new Ingredient('pesto', 75.0);
  List<Ingredient> mealOneIng= [chicken, rice, pesto];
  Meal chickenPesto= new Meal(
        'Chicken Pesto Sauce',
        'Chicken Pesto Sauce with garlic and white rice',
        300,
        false,
        mealOneIng,
        'assets/images/chickenpesto.jpeg');
  List<Meal> boxMeals= [chickenPesto];
  BoxOfMeals weekOneBox= new BoxOfMeals(boxMeals, DateTime.now(), false);
  List<BoxOfMeals> pendingOrders= [weekOneBox];
  List<BoxOfMeals> previousOrders= [];
  User firstUser= new User('Mohamed', 'Medhat', pendingOrders, previousOrders);

  