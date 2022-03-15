import 'package:flutter/material.dart';
import 'package:flutter_playground/categories/checklist/checklist_item/item_detail_page.dart';
import 'package:flutter_playground/categories/checklist/checklist_page.dart';

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
      routes: {
        ChecklistPage.routeName: (ctx) => const ChecklistPage(),
        ItemDetailPage.routeName: (ctx) => const ItemDetailPage(),
      },
    );
  }
}
