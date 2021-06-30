import '../models/meal_model.dart';

import '../models/box_model.dart';
import '../providers/boxes.dart';

class AllBoxes extends Boxes {
  List<BoxOfMeals> _allBoxes = [Boxes().box, Boxes().box2];

  List<BoxOfMeals> get allBoxesData {
    return [..._allBoxes];
  }

  bool evaluateDates(DateTime currentIndex) {
       return _allBoxes.any((day) => day.deliveryTime.day == currentIndex.day);
  }

  BoxOfMeals getBox(DateTime currentIndex) {
    return _allBoxes.firstWhere((date) =>
            date.deliveryTime.day == currentIndex.day &&
            date.deliveryTime.month == currentIndex.month &&
            date.deliveryTime.year == currentIndex.year);
      
  }

  List<BoxOfMeals> get allbox{
    return _allBoxes;
  }

  BoxOfMeals findById(String id) {
    return _allBoxes.firstWhere((box) => box.id == id);
  }
  
}
