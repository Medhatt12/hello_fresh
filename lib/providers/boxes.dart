import '../models/meal_model.dart';

import '../models/box_model.dart';

import './dummy_data.dart';

class Boxes extends Data{

  // int getDifference(int x) {
  //   return x - 1;
  // }

  // void poulateDaysList() {
  //   final DateTime today = DateTime.now();
  //   int find = getDifference(today.weekday);
  //   DateTime firstDay = today.subtract(Duration(days: find + 7));
  //   var currentSelectedDate = firstDay;
  //   var daysShown;
  //       daysShown.add(firstDay);
  //   for (int i = 1; i < 10; i++) {
  //     DateTime temp = firstDay.add(Duration(days: i * 7));
  //     daysShown.add(temp);
  //   }
  // }
  
  BoxOfMeals _weekOneBox =  BoxOfMeals(
      id: 'b1', boxMeals: Data().items, deliveryTime: DateTime.now().subtract(Duration(days: 3)));

  BoxOfMeals _weekTwoBox =  BoxOfMeals(
      id: 'b2', boxMeals: Data().items2, deliveryTime: DateTime.now().add(Duration(days: 4)));


  
  // void poulateDaysList() {
  //   List<DateTime> week =[];
  //   List<DateTime> mondays =[];
  //   final DateTime today = DateTime.now();
    
  //   for (int i = 0; i < 7; i++) {
  //     DateTime temp = today.add(Duration(days:1));
  //     week.add(temp);
  //   }
  //   DateTime monday =week.firstWhere((day) => day.weekday == DateTime.monday);
  //   DateTime firstMonday = monday.subtract(Duration(days: 7));
  //   mondays.add(firstMonday);
  //   for(int x =1;x<10;x++){
  //     DateTime temp = firstMonday.add(Duration(days: x*7));
  //     mondays.add(temp);
  //   }
  // }

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

  List<Meal> getboxmeals(BoxOfMeals c){
    return c.boxMeals.toList();
  }
  
}