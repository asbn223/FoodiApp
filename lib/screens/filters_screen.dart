import 'package:flutter/material.dart';
import 'package:foodi_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = "/filter_screen";

  final Function setFilter;
  final Map<String, bool> currentFilters;

  FilterScreen({this.setFilter, this.currentFilters});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _veg = false;
  bool _lactoseFree = false;

  Widget _buildFilters(
      String title, String Desc, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        Desc,
        style: TextStyle(color: Colors.white),
      ),
      onChanged: updateValue,
      value: currentValue,
      activeColor: Colors.lightGreenAccent,
//      inactiveThumbColor: Colors.limeAccent,
    );
  }

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _veg = widget.currentFilters['veg'];
    _lactoseFree = widget.currentFilters['lactose'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () {
              final filterData = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'veg': _veg,
                'lactose': _lactoseFree
              };
              widget.setFilter(filterData);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "Adjust your filters here!",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildFilters("Gluten Free",
                  "Only Gluten Free meals are selected", _glutenFree, (value) {
                setState(() {
                  _glutenFree = value;
                });
              }),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              _buildFilters("Vegan", "Only Vegan meals are selected", _vegan,
                  (value) {
                setState(() {
                  _vegan = value;
                });
              }),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              _buildFilters(
                  "Vegetarian", "Only Vegetarian Meals are selected", _veg,
                  (value) {
                setState(() {
                  _veg = value;
                });
              }),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              _buildFilters(
                  "Lactose Free",
                  "Only Lactose Free meals are selected",
                  _lactoseFree, (value) {
                setState(() {
                  _lactoseFree = value;
                });
              }),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
