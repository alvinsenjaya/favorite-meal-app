import 'package:favorite_meal/models/meal.dart';
import 'package:favorite_meal/screens/category_screen.dart';
import 'package:favorite_meal/screens/favorite_screen.dart';
import 'package:favorite_meal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Meal> _userFavorites = [];
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(
            _isUserFavorite, _addUserFavorite, _removeUserFavorites),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(_userFavorites, _isUserFavorite,
            _addUserFavorite, _removeUserFavorites),
        'title': 'Favorites',
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  bool _isUserFavorite(Meal meal) {
    return _userFavorites.any((element) => element.id == meal.id);
  }

  void _addUserFavorite(Meal meal) {
    setState(() {
      _userFavorites.add(meal);
    });
  }

  void _removeUserFavorites(Meal meal) {
    setState(() {
      _userFavorites.removeWhere((item) => item.id == meal.id);
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.indigoAccent,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
