import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget {

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('THIS IS THE SETTINGS TAB!')],
          ),
        ],
      ),
    );
  }
}
