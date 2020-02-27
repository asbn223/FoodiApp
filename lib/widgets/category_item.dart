import 'package:flutter/material.dart';
import 'package:foodi_app/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.color, this.title});

  void selectedCategory(BuildContext context) {
//    Navigator.push(context, MaterialPageRoute(builder: (_) {
//      return CategoryMealScreen(
////        title: title,
////        color: color,
//          );
//    }));
    Navigator.pushNamed(context, CategoryMealScreen.routeName,
        arguments: {"title": title, "color": color, "id": id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      borderRadius: BorderRadius.circular(15.0),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
