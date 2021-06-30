import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/build_box_item.dart';

class HomeTab extends StatefulWidget {
  static const routeName = '/home-tab';
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    
    final mediaQuery = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.bottom -
        MediaQuery.of(context).padding.top);

    return SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            BuildBoxItem(context: context, mediaQuery: mediaQuery)
            ]),
    );
  }
}




