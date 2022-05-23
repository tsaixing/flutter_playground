import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/settings_screen.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  _SettingsButtonState createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    User? auth = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: auth == null
          ? IconButton(
              icon: const Icon(Icons.face_outlined),
              tooltip: 'Settings',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  SettingsScreen.routeName,
                );
              },
            )
          : auth.photoURL != null
              ? ClipOval(
                  child: Material(
                    // color: CustomColors.firebaseGrey.withOpacity(0.3),
                    child: Image.network(
                      auth.photoURL!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              : const ClipOval(
                  child: Material(
                    // color: CustomColors.firebaseGrey.withOpacity(0.3),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 60,
                        // color: CustomColors.firebaseGrey,
                      ),
                    ),
                  ),
                ),
    );
  }
}
