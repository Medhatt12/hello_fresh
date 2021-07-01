
import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../screens/meal_details.dart';
import '../screens/tabs_screen.dart';
import '../providers/all_boxes.dart';
import '../providers/boxes.dart';
import '../providers/dummy_data.dart';
import '../screens/home_tab.dart';
import '../screens/mymenu_tab.dart';
import '../screens/notifications_tab.dart';
import '../screens/settings_tab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Data()),
        ChangeNotifierProvider(create: (ctx)=> Boxes()),
        ChangeNotifierProvider(create: (ctx)=>AllBoxes()),
        ChangeNotifierProvider(create: (ctx)=>Meal()),
        ChangeNotifierProvider(create: (ctx) => User()),
      ],
          child: MaterialApp(
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
        // home: FutureBuilder(
        //   future: _fbApp,
        //   builder: (context,snapshot){
        //     if(snapshot.hasError){
        //       print('You have an error! ${snapshot.error.toString()}');
        //       return Text('Something went wrong!');
        //     }else if(snapshot.hasData){
        //       return HomeTab();
        //     }else{
        //       return Center(child: CircularProgressIndicator());
        //     }
        //   }
        // ),
        routes: {
        '/': (ctx) => TabsScreen(),
        HomeTab.routeName: (ctx) => HomeTab(),
        MyMenuTab.routeName: (ctx) => MyMenuTab(),
        NotificationsTab.routeName: (ctx) => NotificationsTab(),
        SettingsTab.routeName:(ctx) =>SettingsTab(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      ),
    );
  }
}

