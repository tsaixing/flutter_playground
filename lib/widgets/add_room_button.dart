import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/add_room_screen.dart';

class AddRoomButton extends StatefulWidget {
  const AddRoomButton({Key? key}) : super(key: key);

  @override
  _AddRoomButtonState createState() => _AddRoomButtonState();
}

class _AddRoomButtonState extends State<AddRoomButton> {
  bool _isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    User? auth = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSignedIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Add Room',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AddRoomScreen.routeName,
                );
              },
            ),
    );
  }
}
