import 'package:flutter/foundation.dart';
import 'meal_model.dart';

class BoxOfMeals {
  final String id;
  final List<Meal> boxMeals;
  final DateTime deliveryTime;

  BoxOfMeals({
    @required this.id,
    @required this.boxMeals,
    @required this.deliveryTime,
  });

  // DateTime findLastEditDate(){
  //   DateTime lastTimeToEdit = deliveryTime.subtract(const Duration(days: 4));
  //   return lastTimeToEdit;
  // }
}
