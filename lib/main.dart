import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/checklist_item_screen.dart';
import 'package:flutter_playground/screens/checklist_screen.dart';

import 'screens/category_screen.dart';

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
      home: const CategoryScreen(),
      routes: {
        ChecklistScreen.routeName: (ctx) => const ChecklistScreen(),
        ChecklistItemScreen.routeName: (ctx) => const ChecklistItemScreen(),
      },
    );
  }
}
