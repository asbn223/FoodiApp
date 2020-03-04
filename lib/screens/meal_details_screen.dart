import 'package:flutter/material.dart';
import 'package:foodi_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail_screen';
  final Function toggleFav, isFavorited;

  MealDetailScreen({this.toggleFav, this.isFavorited});
//  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == id;
    });

    Widget _sectionTitle(String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          title,
          style:
              Theme.of(context).textTheme.title.copyWith(color: Colors.black),
        ),
      );
    }

    Widget _section({Widget child}) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        height: 250.0,
        width: 300.0,
        child: child,
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300.0,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _sectionTitle("Ingredients"),
            _section(
              child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    );
                  }),
            ),
            _sectionTitle("Steps"),
            _section(
              child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 4,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorited(selectedMeal.id) ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          toggleFav(selectedMeal.id);
        },
      ),
    );
  }
}
