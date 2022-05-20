import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/category_screen.dart';
import 'package:flutter_playground/screens/checklist_item_screen.dart';
import 'package:flutter_playground/screens/checklist_screen.dart';
import 'package:flutter_playground/screens/login_screen.dart';

main() => runApp(const SharedList());

class SharedList extends StatelessWidget {
  const SharedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared List",
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      home: const LoginScreen(),
      routes: {
        RoomScreen.routeName: (context) => const RoomScreen(),
        ChecklistScreen.routeName: (context) => const ChecklistScreen(),
        ChecklistItemScreen.routeName: (context) => const ChecklistItemScreen(),
      },
    );
  }
}
