import 'package:flutter/material.dart';

import './type_card.dart';

class TypePage extends StatelessWidget {
  const TypePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2, children: <Widget>[
      TypeCard(
        cardTitle: 'Groceries',
        backgroundImageUrl: 'assets/images/groceries.jpeg',
      ),
      TypeCard(
        cardTitle: 'Hiking',
        backgroundImageUrl: 'assets/images/hiking.jpeg',
      ),
      TypeCard(
        cardTitle: 'Restaurants',
        backgroundImageUrl: 'assets/images/restaurants.jpeg',
      ),
      TypeCard(
        cardTitle: 'Movies',
        backgroundImageUrl: 'assets/images/movies.jpeg',
      ),
      TypeCard(
        cardTitle: 'Chores',
        backgroundImageUrl: 'assets/images/chores.jpeg',
      ),
      TypeCard(
        cardTitle: 'Reading',
        backgroundImageUrl: 'assets/images/reading.jpeg',
      ),
      TypeCard(
        cardTitle: 'Meals',
        backgroundImageUrl: 'assets/images/meals.jpeg',
      ),
      TypeCard(
        cardTitle: 'Vacations',
        backgroundImageUrl: 'assets/images/vacations.jpeg',
      ),
    ]);
  }
}
