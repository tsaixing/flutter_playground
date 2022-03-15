import 'package:flutter/material.dart';

import './categories/category_page.dart';

void main() => runApp(const SharedList());

class SharedList extends StatelessWidget {
  const SharedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared List",
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      home: const CategoryPage(),
    );
  }
}
