import 'package:flutter/material.dart';
import 'package:foodi_app/screens/categories_overview_screen.dart';
import 'package:foodi_app/screens/favorite_screen.dart';
import 'package:foodi_app/widgets/main_drawer.dart';

class BottomBarScreen extends StatefulWidget {
  static const String routeName = '/bottom_bar_screen';

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoryOverviewScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(), 'title': 'Favorites'}
  ];

  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Categories"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Favorite"),
            ),
          ],
          onTap: _selectedPage,
          currentIndex: _selectedPageIndex,
        ),
      ),
    );
  }
}
