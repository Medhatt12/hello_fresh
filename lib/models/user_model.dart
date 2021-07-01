import '../models/box_model.dart';
import 'package:flutter/foundation.dart';

class User with ChangeNotifier{
  final String id;
  final String firstName;
  final String lastName;
  List<BoxOfMeals> pendingOrders;
  List<BoxOfMeals> previousOrders;

  User(
      {@required this.id,
      @required this.firstName,
      @required this.lastName,
      @required this.pendingOrders,
      @required this.previousOrders});

  void addToPendingOrders(BoxOfMeals box){
    pendingOrders.add(box);
    notifyListeners();
  }
}
