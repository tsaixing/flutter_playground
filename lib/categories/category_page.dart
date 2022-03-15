import 'package:flutter/material.dart';
import 'package:flutter_playground/categories/dummy_data.dart';

import './category_card.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView.count(
          padding: const EdgeInsets.all(5),
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1 / 1,
          children: DUMMY_CATEGORIES
              .map((data) => CategoryCard(
                  title: data.title, backgroundImageUrl: data.imageUrl))
              .toList()),
    );
  }
}
