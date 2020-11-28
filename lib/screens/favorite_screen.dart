import 'package:favorite_meal/models/meal.dart';
import 'package:favorite_meal/widgets/meals_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _userFavorites;
  final Function _isUserFavorite;
  final Function _addUserFavorite;
  final Function _removeUserFavorites;

  const FavoriteScreen(this._userFavorites, this._isUserFavorite,
      this._addUserFavorite, this._removeUserFavorites);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(_userFavorites[index], _isUserFavorite,
            _addUserFavorite, _removeUserFavorites);
      },
      itemCount: _userFavorites.length,
    );
  }
}
