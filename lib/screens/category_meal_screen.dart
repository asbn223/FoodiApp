import 'package:flutter/material.dart';
import 'package:foodi_app/models/meal.dart';
import 'package:foodi_app/widgets/main_drawer.dart';
import 'package:foodi_app/widgets/meal_items.dart';

class CategoryMealScreen extends StatefulWidget {
//  final String title;
//  final Color color;
//
//  CategoryMealScreen({this.title, this.color});

  static const String routeName = '/meal_screen';

  final List<Meal> availableMeals;

  CategoryMealScreen({this.availableMeals});

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  Color categoryColor;

  //Did Change Dependencies is used because context is returned only after
  // initState
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArguments = ModalRoute.of(context).settings.arguments as Map;
    categoryTitle = routeArguments['title'];
    categoryColor = routeArguments['color'];
    final categoryId = routeArguments['id'];
    categoryMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
