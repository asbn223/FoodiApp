import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodi_app/screens/category_meal_screen.dart';
import 'package:foodi_app/screens/meal_details_screen.dart';

import 'screens/categories_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Foodi",
      home: CategoryOverviewScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.brown,
        accentColor: Colors.cyan[400],
        fontFamily: "Lora",
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
//                  color: Color.fromRGBO(20, 51, 51, 1),
                  color: Colors.white70,
                  fontFamily: "Simonetta",
                  fontSize: 18),
            ),
      ),
      routes: {
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryOverviewScreen());
      },
    );
  }
}
