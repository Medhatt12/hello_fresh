
import 'package:flutter/material.dart';

import '../models/box_model.dart';

import './dummy_data.dart';

class Boxes extends Data{
  
  BoxOfMeals _weekOneBox =  BoxOfMeals(
      id: 'b1', boxMeals: Data().items, deliveryTime: DateTime.now().subtract(Duration(days: 1)));

  BoxOfMeals _weekTwoBox =  BoxOfMeals(
      id: 'b2', boxMeals: Data().items2, deliveryTime: DateTime.now().add(Duration(days: 6)));

  

  DateTime findLastEditDate(DateTime deliveryTime){
    DateTime lastTimeToEdit = deliveryTime.subtract(const Duration(days: 4));
    return lastTimeToEdit;
  } 

  BoxOfMeals get box{
    return _weekOneBox;
  }
  BoxOfMeals get box2{
    return _weekTwoBox;
  }
  
}