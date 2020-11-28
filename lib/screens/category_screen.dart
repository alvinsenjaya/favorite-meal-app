import 'package:favorite_meal/widgets/category_item.dart';
import 'package:flutter/material.dart';

import 'package:favorite_meal/data/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  final Function _isUserFavorite;
  final Function _addUserFavorite;
  final Function _removeUserFavorites;

  const CategoryScreen(
      this._isUserFavorite, this._addUserFavorite, this._removeUserFavorites);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...DUMMY_CATEGORIES.map(
          (catData) {
            return CategoryItem(catData, _isUserFavorite, _addUserFavorite,
                _removeUserFavorites);
          },
        ).toList(),
      ],
    );
  }
}
