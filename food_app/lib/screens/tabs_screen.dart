import 'package:flutter/material.dart';
import 'package:food_app/screens/category_screen.dart';
import 'package:food_app/screens/favourites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectPage(int index) {
    setState(() {
      selctedPageIndex = index;
    });
  }

  List<Map<String, Object>> _pages;
  int selctedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'pages': CategoryScreen(), 'title': 'Categories'},
      {'pages': FavouritesScreen(widget.favoriteMeals), 'title': 'Favourites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selctedPageIndex]['title']),
      ),
      body: _pages[selctedPageIndex]['pages'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selctedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favourites'))
        ],
      ),
    );
  }
}
