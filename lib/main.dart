import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/add_room_screen.dart';
import 'package:flutter_playground/screens/checklist_screen.dart';
import 'package:flutter_playground/screens/login_screen.dart';
import 'package:flutter_playground/screens/room_screen.dart';
import 'package:flutter_playground/screens/settings_screen.dart';
import 'package:flutter_playground/screens/task_screen.dart';

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
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        RoomScreen.routeName: (context) => const RoomScreen(),
        ChecklistScreen.routeName: (context) => const ChecklistScreen(),
        TaskScreen.routeName: (context) => const TaskScreen(),
        AddRoomScreen.routeName: (context) => const AddRoomScreen()
      },
    );
  }
}
