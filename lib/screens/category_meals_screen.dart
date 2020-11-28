import 'package:favorite_meal/widgets/meals_item.dart';
import 'package:favorite_meal/data/dummy_data.dart';
import 'package:favorite_meal/models/category.dart';
import 'package:favorite_meal/models/meal.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category _category;
  List<Meal> categoryMeals;
  final Function _isUserFavorite;
  final Function _addUserFavorite;
  final Function _removeUserFavorites;

  CategoryMealsScreen(this._category, this._isUserFavorite,
      this._addUserFavorite, this._removeUserFavorites) {
    categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(_category.id);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_category.title}'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index], _isUserFavorite,
              _addUserFavorite, _removeUserFavorites);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
