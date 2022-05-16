import 'package:flutter/material.dart';
import 'package:flutter_playground/temp_data/categories.dart';

import '../widgets/category_card.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category';

  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreen();
}

class _CategoryScreen extends State<CategoryScreen> {
  // final _items = DUMMY_CHECKLIST.toList();

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // final String title = routeArgs['title']!;≠
    // final String description = routeArgs['description']!;
    // final String backgroundImageUrl = routeArgs['backgroundImageUrl']!;

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
                    title: data.title,
                    backgroundImageUrl: data.imageUrl,
                    description: data.description,
                  ))
              .toList()),
    );
  }
}
