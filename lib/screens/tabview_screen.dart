import 'package:flutter/material.dart';
import 'package:foodi_app/widgets/main_drawer.dart';

import 'categories_overview_screen.dart';
import 'favorite_screen.dart';

class TabViewScreen extends StatefulWidget {
  @override
  _TabViewScreenState createState() => _TabViewScreenState();
}

class _TabViewScreenState extends State<TabViewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("Foodi"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: "Categories"),
              Tab(icon: Icon(Icons.favorite_border), text: "Favorite"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoryOverviewScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
