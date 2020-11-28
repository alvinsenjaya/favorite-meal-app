import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.isLactoseFree,
  });

  String get complexityText {
    if (this.complexity == Complexity.Simple)
      return 'Simple';
    else if (this.complexity == Complexity.Hard)
      return 'Hard';
    else if (this.complexity == Complexity.Challenging)
      return 'Challenging';
    else
      return '';
  }

  String get affordabilityText {
    if (this.affordability == Affordability.Affordable)
      return 'Affordable';
    else if (this.affordability == Affordability.Pricey)
      return 'Pricey';
    else if (this.affordability == Affordability.Luxurious)
      return 'Luxurious';
    else
      return '';
  }
}
