import 'package:flutter/material.dart';
import 'package:hello_fresh/models/meal_model.dart';
import 'package:hello_fresh/providers/dummy_data.dart';
import '../providers/all_boxes.dart';
import 'package:provider/provider.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-detail';

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget buildSectionTitle(String text, BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(ctx).textTheme.title),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ids = ModalRoute.of(context).settings.arguments as List<String>;
    final boxSelected = Provider.of<AllBoxes>(context).findById(ids[0]);
    final meal = boxSelected.mealGetter(ids[1]);
    final data = Provider.of<Data>(context);
    final user = data.getUser;

    return Scaffold(
      appBar: AppBar(title: Text('${meal.mealName}')),
      body: ListView(children: <Widget>[
        Column(children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageURL,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle('Ingredients', context),
          buildContainer(
            ListView.builder(
              itemCount: meal.mealIngredients.length,
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                  child: Text(meal.mealIngredients[index]),
                ),
              ),
            ),
          ),
          buildSectionTitle('Description', context),
          buildContainer(Text(meal.mealDescription)),
          buildSectionTitle('Calories & Cooking Time', context),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 60,
            width: 300,
            child: Text(
                'Meal calories: ${meal.calories} Kcal \nMeal cooking time: ${meal.cookingTime} minutes'),
          ),
        ]),
      ]),
      floatingActionButton: Consumer<Meal>(
        builder: (context, meal2, _) => FloatingActionButton(
          child: Icon(meal.isChoosen ? Icons.delete : Icons.add),
          onPressed: () {
            //print(meal.isChoosen);
            setState(() {
              meal.toggleChoosenStatus();
              user.addToPendingOrders(boxSelected);
            });
          },
        ),
      ),
    );
  }
}
