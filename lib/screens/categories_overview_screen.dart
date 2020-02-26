import 'package:flutter/material.dart';
import 'package:foodi_app/widgets/category_item.dart';
import 'package:foodi_app/dummy_data.dart';

class CategoryOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text("Foodi"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15.0),
        children: DUMMY_CATEGORY.map((catData) {
          return CategoryItem(
            color: catData.color,
            title: catData.title,
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
      ),
    );
  }
}
