import 'package:favorite_meal/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatefulWidget {
  final Meal _meal;
  final Function _isUserFavorite;
  final Function _addUserFavorite;
  final Function _removeUserFavorites;

  MealDetailScreen(this._meal, this._isUserFavorite, this._addUserFavorite,
      this._removeUserFavorites);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget._meal.title}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: widget._isUserFavorite(widget._meal)
            ? Icon(Icons.star)
            : Icon(Icons.star_border),
        onPressed: () {
          setState(() {
            if (widget._isUserFavorite(widget._meal)) {
              widget._removeUserFavorites(widget._meal);
            } else {
              widget._addUserFavorite(widget._meal);
            }
          });
        },
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              widget._meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Ingredients',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...widget._meal.ingredients.map((ingredient) {
                    return Card(
                      child: Text(ingredient),
                      color: Colors.indigo[50],
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Steps',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...widget._meal.steps.map((step) {
                    return Card(
                      child: Text(step),
                      color: Colors.indigo[50],
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
