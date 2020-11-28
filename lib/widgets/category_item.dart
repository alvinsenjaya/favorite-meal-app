import 'package:favorite_meal/screens/category_meals_screen.dart';
import 'package:favorite_meal/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;
  final Function _isUserFavorite;
  final Function _addUserFavorite;
  final Function _removeUserFavorites;

  CategoryItem(this._category, this._isUserFavorite, this._addUserFavorite,
      this._removeUserFavorites);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) {
        return CategoryMealsScreen(
            _category, _isUserFavorite, _addUserFavorite, _removeUserFavorites);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            _category.title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _category.color.withOpacity(0.7),
              _category.color,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
