import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/room_card.dart';

class RoomScreen extends StatefulWidget {
  static const routeName = '/category';

  const RoomScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RoomScreen> createState() => _CategoryScreen();
}

class _CategoryScreen extends State<RoomScreen> {
  // final _items = DUMMY_CHECKLIST.toList();

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // final String title = routeArgs['title']!;≠
    // final String description = routeArgs['description']!;
    // final String backgroundImageUrl = routeArgs['backgroundImageUrl']!;

    return Scaffold(
        appBar: AppBar(title: const Text('Categories')), body: fetchRooms());
  }

  StreamBuilder fetchRooms() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("categories").snapshots(),
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
                    title: data['title'],
                    backgroundImageUrl: data['imageUrl'],
                    description: data['description'],
                  );
                }).toList(),
              ],
            );
          }
        });
  }
}
