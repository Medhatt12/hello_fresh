import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../providers/dummy_data.dart';
import '../providers/all_boxes.dart';
import '../providers/boxes.dart';
import '../widgets/build_welcoming_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BuildBoxItem extends StatelessWidget {
  const BuildBoxItem({
    Key key,
    @required this.context,
    @required this.mediaQuery,
  }) : super(key: key);

  final BuildContext context;
  final double mediaQuery;

  @override
  Widget build(BuildContext context) {
      final boxesData = Provider.of<Boxes>(context);
      //final functionGetter = boxesData.getChosenMeals(weekMeals);
      final allboxesData1 = Provider.of<AllBoxes>(context);
      final boxData = Provider.of<Data>(context);
      final user = boxData.userData;

    return Container(
        height: (mediaQuery - 100),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: user.pendingOrders.length!= 0? user.pendingOrders.length+1:1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return BuildWelcomingWidget(context: context, mediaQuery: mediaQuery);
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
                                DateFormat('EEE.').format(user.pendingOrders[index].deliveryTime),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.green[900]),
                              ),
                              Text(
                                DateFormat('dd').format(user.pendingOrders[index].deliveryTime),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[900]),
                              ),
                              Text(
                                DateFormat('MMM').format(user.pendingOrders[index].deliveryTime),
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
                                'Edit meals untill ' +
                                    DateFormat('dd')
                                        .format(boxesData.findLastEditDate(user.pendingOrders[index].deliveryTime)) +
                                    ' ' +
                                    DateFormat('MMMM')
                                        .format(boxesData.findLastEditDate(user.pendingOrders[index].deliveryTime)),
                                style: TextStyle(color: Colors.green[900])
                                ),
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
                      itemCount: boxesData.getChosenMeals(user.pendingOrders[index]).length,
                      itemBuilder: (BuildContext context, int index2) {
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
                                child: Image.network(
                                  boxesData.getChosenMeals(user.pendingOrders[index])[index2].imageURL,
                                  height: 280.0,
                                  width: 180.0,
                                  
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
                                          boxesData.getChosenMeals(user.pendingOrders[index])[index2].mealName,
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
}