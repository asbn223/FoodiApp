import 'package:flutter/material.dart';
import 'package:foodi_app/dummy_data.dart';
import 'package:foodi_app/widgets/main_drawer.dart';
import 'package:foodi_app/widgets/meal_items.dart';

class CategoryMealScreen extends StatelessWidget {
//  final String title;
//  final Color color;
//
//  CategoryMealScreen({this.title, this.color});

  static const String routeName = '/meal_screen';

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context).settings.arguments as Map;
    final categoryTitle = routeArguments['title'];
    final categoryColor = routeArguments['color'];
    final categoryId = routeArguments['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
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
