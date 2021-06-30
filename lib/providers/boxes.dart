import '../models/meal_model.dart';

import '../models/box_model.dart';

import './dummy_data.dart';

class Boxes extends Data{
  
  BoxOfMeals _weekOneBox =  BoxOfMeals(
      id: 'b1', boxMeals: Data().items, deliveryTime: DateTime.now().subtract(Duration(days: 2)));

  BoxOfMeals _weekTwoBox =  BoxOfMeals(
      id: 'b2', boxMeals: Data().items2, deliveryTime: DateTime.now().add(Duration(days: 5)));

  

  DateTime findLastEditDate(DateTime deliveryTime){
    DateTime lastTimeToEdit = deliveryTime.subtract(const Duration(days: 4));
    return lastTimeToEdit;
  } 

  List<Meal> getChosenMeals(BoxOfMeals weekMeals) {
    return weekMeals.boxMeals.where((meal) => meal.isChoosen ==true).toList();    
  }
  
  BoxOfMeals get box{
    return _weekOneBox;
  }
  BoxOfMeals get box2{
    return _weekTwoBox;
  }
  
}