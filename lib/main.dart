import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/home_screen.dart';
import 'package:flutter_playground/screens/login_screen.dart';
import 'package:flutter_playground/screens/room/add_room_screen.dart';
import 'package:flutter_playground/screens/room/edit_room_screen.dart';
import 'package:flutter_playground/screens/room/room_screen.dart';
import 'package:flutter_playground/screens/settings_screen.dart';
import 'package:flutter_playground/screens/task/edit_task_screen.dart';
import 'package:flutter_playground/screens/task/task_screen.dart';

main() => runApp(const SharedList());

class SharedList extends StatelessWidget {
  const SharedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared List",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF151026),
        ),
        fontFamily: 'Quicksand',
      ),
      home: const LoginScreen(),
      routes: {
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),

        // Room
        RoomScreen.routeName: (context) => const RoomScreen(),
        AddRoomScreen.routeName: (context) => const AddRoomScreen(),
        EditRoomScreen.routeName: (context) => const EditRoomScreen(),

        // Task
        TaskScreen.routeName: (context) => const TaskScreen(),
        EditTaskScreen.routeName: (context) => const EditTaskScreen(),
      },
    );
  }
}
