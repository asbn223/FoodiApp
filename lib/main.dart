import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodi_app/dummy_data.dart';
import 'package:foodi_app/models/meal.dart';
import 'package:foodi_app/screens/bottom_bar_screen.dart';
import 'package:foodi_app/screens/category_meal_screen.dart';
import 'package:foodi_app/screens/filters_screen.dart';
import 'package:foodi_app/screens/meal_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'vegan': false,
    'veg': false,
    'lactose': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filter['veg'] && !meal.isVegetarian) {
          return false;
        }
        if (_filter['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Foodi",
      home: BottomBarScreen(),
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
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              textTheme: TextTheme(
                title: TextStyle(
//                  color: Color.fromRGBO(20, 51, 51, 1),
                    color: Colors.white70,
                    fontFamily: "Simonetta",
                    fontSize: 20),
              ),
            ),
      ),
      routes: {
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        BottomBarScreen.routeName: (context) => BottomBarScreen(),
        FilterScreen.routeName: (context) => FilterScreen(
              setFilter: _setFilter,
              currentFilters: _filter,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => BottomBarScreen());
      },
    );
  }
}
