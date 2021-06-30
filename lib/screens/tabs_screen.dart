import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hello_fresh/screens/notifications_tab.dart';
import 'package:hello_fresh/screens/settings_tab.dart';

import '../screens/home_tab.dart';
import '../screens/mymenu_tab.dart';

class TabsScreen extends StatefulWidget {

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentTabIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    MyMenuTab(),
    NotificationsTab(),
    SettingsTab(),
  ];

  onTapped(int index) {
    setState(() {
      DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("test");
    _testRef.set("Hello world ${Random().nextInt(100)}");
      currentTabIndex = index;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'My Menu',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: currentTabIndex,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          selectedItemColor: Colors.green[800],
          onTap: onTapped,
        ),
      ),
    );
  }
}