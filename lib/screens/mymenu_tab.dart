import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_fresh/models/box_model.dart';
import 'package:hello_fresh/models/ingredient_model.dart';
import 'package:hello_fresh/models/meal_model.dart';
import 'package:hello_fresh/models/user_model.dart';
import 'package:intl/intl.dart';

class MyMenuTab extends StatefulWidget {
  @override
  _MyMenuTabState createState() => _MyMenuTabState();
}

class _MyMenuTabState extends State<MyMenuTab> {
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

  List<DateTime> daysShown = [];
  int _selectedindex = 0;
  int _selectedindex2 = 0;
  ScrollController _scrollViewController;
  bool isScrollingDown = false;
  bool once = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
          });
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          setState(() {
            isScrollingDown = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  int getDifference(int x) {
    return x - 1;
  }

  void poulateDaysList() {
    final DateTime today = DateTime.now();
    int find = getDifference(today.weekday);
    DateTime firstDay = today.subtract(Duration(days: find + 7));
    daysShown.add(firstDay);
    for (int i = 1; i < 10; i++) {
      DateTime temp = firstDay.add(Duration(days: i * 7));
      daysShown.add(temp);
    }
  }

  Widget _buildSlidingMondays() {
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
            padding: isScrollingDown == false
                ? EdgeInsets.only(bottom: 10, left: 0, right: 0, top: 0)
                : EdgeInsets.all(0),
            child: Container(
              height: isScrollingDown == false ? 90 : 75,
              color: Colors.white,
              child: isScrollingDown == false
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: daysShown.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedindex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green[900]),
                              color: index == _selectedindex
                                  ? Colors.white
                                  : Colors.red[100],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            height: 80,
                            width: 90,
                            margin: EdgeInsets.only(
                                top: 12.0, bottom: 12, right: 10.0, left: 10),
                            child: FittedBox(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    AutoSizeText(
                                      DateFormat('EEE.')
                                          .format(daysShown[index]),
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Colors.green[900]),
                                    ),
                                    AutoSizeText(
                                      DateFormat('dd').format(daysShown[index]),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[900]),
                                    ),
                                    AutoSizeText(
                                      DateFormat('MMM')
                                          .format(daysShown[index]),
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Colors.green[900]),
                                    ),
                                    //SizedBox(height: 2),
                                  ]),
                            ),
                          ),
                        );
                      })
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(
                              'Available to edit until ' +
                                  DateFormat('EEEE, dd. MMMM')
                                      .format(DateTime.now()
                                          .subtract(Duration(days: 3)))
                                      .toString(),
                              style: Theme.of(context).textTheme.title,
                              textAlign: TextAlign.left,
                              maxFontSize: 17,
                            ),
                            AutoSizeText(
                              'Today is ' +
                                  DateFormat('EEEE, dd. MMMM')
                                      .format(DateTime.now()),
                              style: Theme.of(context).textTheme.subtitle,
                            ),
                          ]),
                    ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    if (once == false) {
      poulateDaysList();
      once = true;
    }
    final mediaQuery = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.bottom -
        MediaQuery.of(context).padding.top);

    return SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
      _buildSlidingMondays(),
      Container(
          height: isScrollingDown == false
              ? (mediaQuery - 200)
              : (mediaQuery - 175),
          child: ListView.builder(
              controller: _scrollViewController,
              scrollDirection: Axis.vertical,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index2) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedindex2 = index2;
                    });
                  },
                  child: Container(
                    height: 300,
                    margin: EdgeInsets.only(
                        top: 0.0, bottom: 14, right: 12, left: 12),
                    decoration: BoxDecoration(
                        color: Colors.green[900],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green[900])),
                    child: Stack(alignment: Alignment.topCenter, children: <
                        Widget>[
                      Positioned(
                        top: 150.0,
                        child: Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width - 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0,
                                      left: 8.0,
                                      bottom: 8.0,
                                      top: 7.0),
                                  child: AutoSizeText(
                                    weekOneBox.boxMeals[0].mealName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                    left: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: AutoSizeText(
                                    weekOneBox.boxMeals[0].mealDescription,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                    left: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: AutoSizeText(
                                    '35 Minutes | Family',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                              child: Image(
                                height: 150.0,
                                width: MediaQuery.of(context).size.width - 20,
                                image:
                                    AssetImage(weekOneBox.boxMeals[0].imageURL),
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        //color: Colors.red,
                        height: 50,
                        margin: EdgeInsets.only(top:250.0),
                        decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              AutoSizeText(
                                    '1 Meal in your box',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: 3,),
                              AutoSizeText(
                                    '( 2 Portions )',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ]
                          ),
                      )
                    ]),
                  ),
                );
              }))
    ]));
  }
}
