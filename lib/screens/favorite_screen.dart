import 'package:flutter/material.dart';
import 'package:foodi_app/models/meal.dart';
import 'package:foodi_app/widgets/meal_items.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favMeals;

  FavoriteScreen({this.favMeals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favMeals[index].id,
          title: favMeals[index].title,
          duration: favMeals[index].duration,
          imageUrl: favMeals[index].imageUrl,
          complexity: favMeals[index].complexity,
          affordability: favMeals[index].affordability,
        );
      },
      itemCount: favMeals.length,
    );
  }
}
