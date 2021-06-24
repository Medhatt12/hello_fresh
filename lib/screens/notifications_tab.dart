import 'package:flutter/material.dart';

class NotificationsTab extends StatefulWidget {

  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('THIS IS THE NOTIFICATIONS TAB!')],
          ),
        ],
      ),
    );
  }
}
