import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/meal_model.dart';

class Data with ChangeNotifier {
  User _firstUser = new User(
    firstName: 'Mohamed',
    lastName: 'Medhat',
    id: 'U1',
  );

  List<Meal> _meals = [
    Meal(
      id: 'm1',
      mealName: 'Chicken with Pesto Sauce',
      calories: 1000,
      isVegan: false,
      mealDescription:
          'Chicken breasts with pesto sauce served with white rice',
      mealIngredients: [
        '250 Grams of Chicken',
        '500 Grams of rice',
        '100 Grams of Pesto'
      ],
      imageURL:
          'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/4/12/0/FN_Grilled-Chicken-Spinach-Pesto_s4x3.jpg.rend.hgtvcom.616.462.suffix/1371597359023.jpeg',
      cookingTime: 50,
      isChoosen: false,
    ),
    Meal(
      id: 'm2',
      mealName: 'Creamy white sauce shrimp pasta',
      calories: 1800,
      isVegan: false,
      mealDescription:
          'This easy shrimp alfredo pasta recipe is perfect for busy weeknights! A creamy white sauce, fettuccine noodles, parmesan cheese, and simple sautéed shrimp make a hearty and filling meal – and it’s lightened up with no heavy cream in sight!',
      mealIngredients: [
        '350 Grams of Pasta',
        '500 Grams of Shrimps',
        '40 Grams of Unsalted Butter',
        '100 Grams of Milk',
        '150 Grams of Parmesian Cheese'
      ],
      imageURL:
          'https://i2.wp.com/www.lifeasastrawberry.com/wp-content/uploads/2015/04/IMG_3934s.jpg',
      cookingTime: 40,
      isChoosen: false,
    ),
    Meal(
      id: 'm6',
      mealName: 'Classic Cheeseburger',
      calories: 1750,
      isVegan: false,
      mealDescription:
          'The All-time classic cheeseburger',
      mealIngredients: [
      '300g Cattle Hack',
      '1 Tomato',
      '1 Cucumber',
      '1 Onion',
      'Ketchup',
      '2 Burger Buns'
      ],
      imageURL:
          'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
      cookingTime: 40,
      isChoosen: false,
    ),
  ];

  List<Meal> _meals2 = [
    Meal(
      id: 'm3',
      mealName: 'Wiener Schnitzel',
      calories: 1300,
      isVegan: false,
      mealDescription:
          'Wiener Schnitzel  is a type of schnitzel made of a thin, breaded, pan-fried veal cutlet.',
      mealIngredients: [
        '5-ounce veal cutlets',
        '1/4 cup all-purpose flour',
        '1/2 teaspoon kosher salt',
        '2 large eggs',
        '1/2 cup breadcrumbs'
      ],
      imageURL:
          'https://www.thespruceeats.com/thmb/LeyN-7W9T0KB2nl6pcuDZckHnjc=/4288x2848/filters:fill(auto,1)/wiener-schnitzel-recipe-1447089-Hero-5b587d6c46e0fb0071b0059d.jpg',
      cookingTime: 45,
      isChoosen: false,
    ),
    Meal(
      id: 'm4',
      mealName: 'Spaghetti with Tomato Sauce',
      calories: 1000,
      isVegan: true,
      mealDescription:
          'Spaghetti Recipe with tomato sauce, garlic and Parmesan. It is quick and easy but tastes like a fancy Italian restaurant dinner.',
      mealIngredients: [
        '3 tablespoons extra-virgin olive oil',
        '4 cloves garlic, very thinly sliced',
        'Kosher salt',
        'Pinch crushed red pepper flakes',
        '12 ounces spaghetti',
        'Grated Parmesian'
      ],
      imageURL:
          'https://www.giallozafferano.com/images/228-22832/spaghetti-with-tomato-sauce_1200x800.jpg',
      cookingTime: 30,
      isChoosen: false,
    ),
    Meal(
      id: 'm5',
      mealName: 'Toast Hawaii',
      calories: 600,
      isVegan: false,
      mealDescription:
          'An open sandwich consisting of a slice of toast with ham and cheese, and a maraschino cherry in the middle of a pineapple slice, broiled, so that the cheese starts to melt.',
      mealIngredients: [
      '1 Slice White Bread',
      '1 Slice Ham',
      '1 Slice Pineapple',
      '1-2 Slices of Cheese',
      'Butter'
      ],
      imageURL:
          'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
      cookingTime: 10,
      isChoosen: false,
    )
  ];

  List<Meal> get items {
    return [..._meals];
  }
   List<Meal> get items2 {
    return [..._meals2];
  }

  User get getUser {
    return _firstUser;
  }

}
