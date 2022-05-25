import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/room/add_room_screen.dart';

class AddRoomButton extends StatefulWidget {
  const AddRoomButton({Key? key}) : super(key: key);

  @override
  _AddRoomButtonState createState() => _AddRoomButtonState();
}

class _AddRoomButtonState extends State<AddRoomButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      tooltip: 'Add Room',
      onPressed: () {
        Navigator.of(context).pushNamed(
          AddRoomScreen.routeName,
        );
      },
    );
  }
}
