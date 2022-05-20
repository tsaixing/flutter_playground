import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  const Room({
    required this.id,
    required this.title,
    this.description = "",
    this.imageUrl = "",
  });

  Room.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  )   : id = snapshot.data()?["id"],
        title = snapshot.data()?["title"],
        description = snapshot.data()?["description"],
        imageUrl = snapshot.data()?["imageUrl"];

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (title != null) "title": title,
      if (description != null) "description": description,
      if (imageUrl != null) "imageUrl": imageUrl,
    };
  }
}
