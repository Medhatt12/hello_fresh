import 'package:flutter/material.dart';
import 'package:hello_fresh/screens/home_tab.dart';
import 'package:hello_fresh/screens/mymenu_tab.dart';
import 'package:hello_fresh/screens/notifications_tab.dart';
import 'package:hello_fresh/screens/settings_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HelloFresh',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.grey,
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          subtitle: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTabIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    MyMenuTab(),
    NotificationsTab(),
    SettingsTab(),
  ];

  onTapped(int index) {
    setState(() {
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
