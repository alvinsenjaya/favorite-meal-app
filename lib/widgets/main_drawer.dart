import 'package:favorite_meal/screens/about_screen.dart';
import 'package:favorite_meal/screens/tab_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.indigo[50],
            child: Text(
              'Favorite Meal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) {
                  return TabScreen();
                },
              ));
            },
          ),
          buildListTile(
            'About',
            Icons.settings,
            () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) {
                  return AboutScreen();
                },
              ));
            },
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, Function onTapFunction) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapFunction,
    );
  }
}
