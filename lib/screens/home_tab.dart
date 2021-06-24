import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_fresh/models/box_model.dart';
import 'package:hello_fresh/models/ingredient_model.dart';
import 'package:hello_fresh/models/meal_model.dart';
import 'package:hello_fresh/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<BoxOfMeals> pendingOrders;
  List<BoxOfMeals> previousOrders;
  User firstUser;
  Ingredient chicken;
  Ingredient rice;
  Ingredient pesto;
  List<Ingredient> mealOneIng;
  Meal chickenPesto;
  List<Meal> boxMeals;
  BoxOfMeals weekOneBox;

  Widget _buildNamedHello(double mediaQuery) {
    chicken = new Ingredient('Chicken', 250.0);
    rice = new Ingredient('rice', 150.0);
    pesto = new Ingredient('pesto', 75.0);
    mealOneIng = [chicken, rice, pesto];
    chickenPesto = new Meal(
        'Chicken Pesto Sauce',
        'Chicken Pesto Sauce with garlic and white rice',
        300,
        false,
        mealOneIng,
        'assets/images/chickenpesto.jpeg');
    boxMeals = [chickenPesto];
    weekOneBox = new BoxOfMeals(boxMeals, DateTime.now(), false);
    pendingOrders = [weekOneBox];
    previousOrders = [];
    firstUser = new User('Mohamed', 'Medhat', pendingOrders, previousOrders);

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 17, right: 5, top: 10),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello ' + firstUser.firstName + '!',
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                'Today is ' +
                    DateFormat('EEEE, dd. MMMM').format(DateTime.now()),
                style: Theme.of(context).textTheme.subtitle,
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Box Settings',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CupertinoButton(
                    child: Text('Edit',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScallableContainers(double mediaQuery) {
    return Container(
        height: (mediaQuery - 100),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _buildNamedHello(mediaQuery);
            }
            index -= 1;
            return Container(
              margin: EdgeInsets.only(top: 0.0, bottom: 12.0),
              color: Colors.white,
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FittedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SizedBox(height: 2),
                              Text(
                                DateFormat('EEE.').format(DateTime.now()),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.green[900]),
                              ),
                              Text(
                                DateFormat('dd').format(DateTime.now()),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[900]),
                              ),
                              Text(
                                DateFormat('MMM').format(DateTime.now()),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.green[900]),
                              ),
                              SizedBox(height: 2),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Pending',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900]),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                'Change delivery untill ' +
                                    DateFormat('dd')
                                        .format(weekOneBox.findLastEditDate()) +
                                    ' ' +
                                    DateFormat('MMMM')
                                        .format(weekOneBox.findLastEditDate()),
                                style: TextStyle(color: Colors.green[900])),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      OutlineButton(
                          borderSide: BorderSide(color: Colors.green[900]),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Text(
                            'Choose',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
                          onPressed: () {})
                    ],
                  ),
                ),
                Container(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: EdgeInsets.only(
                                left: 12.0,
                                right: 6.0,
                                top: 12.0,
                                bottom: 12.0),
                            height: 280,
                            width: 160,
                            child: Stack(children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                  height: 280.0,
                                  width: 180.0,
                                  image: AssetImage(
                                      weekOneBox.boxMeals[0].imageURL),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 4.0, top: 0, right: 0, left: 5),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        height: 28,
                                        //color: Colors.red,
                                        child: AutoSizeText(
                                          weekOneBox.boxMeals[0].mealName,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                              minFontSize: 1,
                                              maxLines: 500,
                                        ),
                                      ),
                                    ]),
                              ),
                            ]));
                      }),
                ),
              ]),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.bottom -
        MediaQuery.of(context).padding.top);

    return SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_buildScallableContainers(mediaQuery)]),
    );
  }
}
