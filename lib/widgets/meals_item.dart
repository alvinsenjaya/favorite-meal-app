import 'package:favorite_meal/models/meal.dart';
import 'package:favorite_meal/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final Meal _meal;
  final Function _addUserFavorite;
  final Function _removeUserFavorites;
  final Function _isUserFavorite;

  const MealItem(this._meal, this._isUserFavorite, this._addUserFavorite,
      this._removeUserFavorites);

  void _showMealDetail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) {
        return MealDetailScreen(
            _meal, _isUserFavorite, _addUserFavorite, _removeUserFavorites);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showMealDetail(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    _meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    color: Colors.black54,
                    child: Text(
                      _meal.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${_meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_outline_rounded),
                      SizedBox(width: 6),
                      Text('${_meal.complexityText}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.monetization_on_outlined),
                      SizedBox(width: 6),
                      Text('${_meal.affordabilityText}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
