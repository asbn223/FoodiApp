import 'package:flutter/material.dart';
import 'package:foodi_app/screens/bottom_bar_screen.dart';
import 'package:foodi_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
//          DrawerHeader(
//            child: Text(
//              "Welcome Foodies",
//              style: TextStyle(color: Colors.black, fontSize: 32),
//            ),
//            decoration: BoxDecoration(color: Colors.orange),
//            margin: EdgeInsets.all(0),
//          ),
          UserAccountsDrawerHeader(
            accountName: Text("Sabin Nakarmi"),
            accountEmail: Text("asbn2231@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://scontent.fktm3-1.fna.fbcdn.net/v/t1.0-9/56422317_2181938341852766_5762457462405857280_n.jpg?_nc_cat=101&_nc_sid=85a577&_nc_ohc=dqE271fD51IAX9-5GWH&_nc_ht=scontent.fktm3-1.fna&oh=bf0d3f094371fc30c3bba527e818d043&oe=5EBC9D08"),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.black,
            ),
            title: Text("Meals"),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, BottomBarScreen.routeName);
            },
          ),
          Divider(
            color: Colors.black,
            thickness: 4,
          ),
          ListTile(
            leading: Icon(
              Icons.filter_vintage,
              color: Colors.black,
            ),
            title: Text("Filters"),
            onTap: () {
              Navigator.pushReplacementNamed(context, FilterScreen.routeName);
            },
          ),
          Divider(
            color: Colors.black,
            thickness: 4,
          )
        ],
      ),
    );
  }
}
