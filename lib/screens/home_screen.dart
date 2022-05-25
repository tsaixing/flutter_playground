import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/buttons/add_room_button.dart';
import 'package:flutter_playground/widgets/buttons/quick_note_button.dart';
import 'package:flutter_playground/widgets/buttons/room_card.dart';
import 'package:flutter_playground/widgets/buttons/settings_button.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/room';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms'),
        actions: const <Widget>[AddRoomButton(), SettingsButton()],
      ),
      body: fetchRooms(),
      floatingActionButton: const QuickNoteButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  StreamBuilder fetchRooms() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('rooms').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong!');
        }

        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else {
          return GridView.count(
            padding: const EdgeInsets.all(5),
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 1 / 1,
            children: [
              ...snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return RoomCard(
                  title: data['title'] ?? '',
                  backgroundImageUrl: data['imageUrl'] ?? '',
                  description: data['description'] ?? '',
                );
              }).toList(),
            ],
          );
        }
      },
    );
  }
}
