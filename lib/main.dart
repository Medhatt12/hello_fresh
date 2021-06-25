import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_fresh/screens/home_tab.dart';
import 'package:hello_fresh/screens/mymenu_tab.dart';
import 'package:hello_fresh/screens/notifications_tab.dart';
import 'package:hello_fresh/screens/settings_tab.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
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
      home: FutureBuilder(
        future: _fbApp,
        builder: (context,snapshot){
          if(snapshot.hasError){
            print('You have an error! ${snapshot.error.toString()}');
            return Text('Something went wrong!');
          }else if(snapshot.hasData){
            return MyHomePage();
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
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
