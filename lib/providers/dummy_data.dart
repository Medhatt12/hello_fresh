import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/meal_model.dart';

class Data with ChangeNotifier {
  User _firstUser = new User(
    firstName: 'Mohamed',
    lastName: 'Medhat',
    id: 'U1',
    pendingOrders: [],
    previousOrders: []
  );

  List<Meal> _meals = [
    Meal(
      id: 'm1',
      mealName: 'Chicken with Pesto Sauce',
      calories: 1000,
      isVegan: false,
      isGlutenFree: false,
      isLactoseFree: false,
      isVegetarian: false,
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

      isGlutenFree: false,
      isLactoseFree: false,
      isVegetarian: false,
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

      isGlutenFree: false,
      isLactoseFree: false,
      isVegetarian: false,
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
    Meal(
      id: 'm8',
      mealName: 'Delicious Orange Mousse',
      calories: 960,
      isVegan: false,
      isGlutenFree: true,
      isLactoseFree: false,
      isVegetarian: true,
      mealDescription:
          'This delicious orange recipe from Galton Blackiston crafts two exquisite desserts in one: orange mousse paired with orange sorbet.',
      mealIngredients: [
      '4 Sheets of Gelatine',
      '150ml Orange Juice',
      '80g Sugar',
      '300g Yoghurt',
      '200g Cream',
      'Orange Peel',
      ],
      imageURL:
          'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
      cookingTime: 240,
      isChoosen: false,
    ),
    Meal(
      id: 'm9',
      mealName: 'Asparagus Salad with Cherry Tomatoes',
      calories: 760,
      isVegan: true,
      isGlutenFree: true,
      isLactoseFree: true,
      isVegetarian: true,
      mealDescription:
          'Cherry tomatoes and asparagus combine in this salad to make the perfect summer supper',
      mealIngredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
      ],
      imageURL:
          'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
      cookingTime: 30,
      isChoosen: false,
    ),
    Meal(
      id: 'm10',
      mealName: 'Chocolate Souffle',
      calories: 760,
      isVegan: false,
      isGlutenFree: true,
      isLactoseFree: false,
      isVegetarian: true,
      mealDescription:
          'These visually impressive individual chocolate soufflés are perfect for your special someone. If you\'re serving more people, the recipe should scale up just fine.',
      mealIngredients: [
      '1 Teaspoon melted Butter',
      '2 Tablespoons white Sugar',
      '2 Ounces 70% dark Chocolate, broken into pieces',
      '1 Tablespoon Butter',
      '1 Tablespoon all-purpose Flour',
      '4 1/3 tablespoons cold Milk',
      '1 Pinch Salt',
      '1 Pinch Cayenne Pepper',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Cream of Tartar',
      '1 Tablespoon white Sugar',
      ],
      imageURL:
          'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
      cookingTime: 45,
      isChoosen: false,
    ),
  ];

  List<Meal> _meals2 = [
    Meal(
      id: 'm3',
      mealName: 'Wiener Schnitzel',
      calories: 1300,
      isVegan: false,

      isGlutenFree: false,
      isLactoseFree: false,
      isVegetarian: false,
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

      isGlutenFree: false,
      isLactoseFree: true,
      isVegetarian: true,
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
      isGlutenFree: false,
      isLactoseFree: false,
      isVegetarian: false,
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
    ),
    Meal(
      id: 'm7',
      mealName: 'Salad with Smoked Salmon',
      calories: 800,
      isVegan: false,
      isGlutenFree: true,
      isLactoseFree: true,
      isVegetarian: true,
      mealDescription:
          'Asian Smoked Salmon Salad, Marinated Smoked Salmon Salad With Beetroot, Avocado and Green Apples.',
      mealIngredients: [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper'
      ],
      imageURL:
          'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
      cookingTime: 15,
      isChoosen: false,
    ),
    Meal(
      id: 'm11',
      mealName: 'Pancakes',
      calories: 900,
      isVegan: false,
      isGlutenFree: true,
      isLactoseFree: false,
      isVegetarian: true,
      mealDescription:
          'A pancake is a flat cake, often thin and round, prepared from a starch-based batter that may contain eggs, milk and butter and cooked on a hot surface such as a griddle or frying pan, often frying with oil or butter.',
      mealIngredients: [
      '1 1/2 Cups all-purpose Flour',
      '3 1/2 Teaspoons Baking Powder',
      '1 Teaspoon Salt',
      '1 Tablespoon White Sugar',
      '1 1/4 cups Milk',
      '1 Egg',
      '3 Tablespoons Butter, melted',
      ],
      imageURL:
          'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
      cookingTime: 20,
      isChoosen: false,
    ),
    Meal(
      id: 'm12',
      mealName: 'Creamy Indian Chicken Curry',
      calories: 1300,
      isVegan: false,
      isGlutenFree: true,
      isLactoseFree: true,
      isVegetarian: false,
      mealDescription:
          'Creamy Coconut Chicken Curry is an easy to make and healthy weeknight curry dinner recipe. It takes only 30 minutes to make and leftovers for lunch will put a big smile on your face. It\'s sugar-free, dairy-free, and delicious!',
      mealIngredients: [
      '4 Chicken Breasts',
      '1 Onion',
      '2 Cloves of Garlic',
      '1 Piece of Ginger',
      '4 Tablespoons Almonds',
      '1 Teaspoon Cayenne Pepper',
      '500ml Coconut Milk',
      ],
      imageURL:
          'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
      cookingTime: 35,
      isChoosen: false,
    )
  ];

  User get userData{
    return _firstUser;
  }
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
