import 'package:hello_fresh/models/box_model.dart';

class User{
  String firstName;
  String lastName;
  List<BoxOfMeals> pendingOrders;
  List<BoxOfMeals> previousOrders;

  User(this.firstName,this.lastName,this.pendingOrders,this.previousOrders);

  void addToPendingOrders(BoxOfMeals box){
    pendingOrders.add(box);
  }
}