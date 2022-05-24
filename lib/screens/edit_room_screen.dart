import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditRoomScreen extends StatefulWidget {
  static const routeName = '/edit_room';

  const EditRoomScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EditRoomScreen> createState() => _EditRoomScreen();
}

class _EditRoomScreen extends State<EditRoomScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  String title = "";
  String? description;
  // final _items = DUMMY_CHECKLIST.toList();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String id = routeArgs['id']!;
    final String title = routeArgs['title']!;
    final String description = routeArgs['description']!;
    final String backgroundImageUrl = routeArgs['backgroundImageUrl']!;

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Room'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: AssetImage(backgroundImageUrl)),
            ),
          ),
        ),
        body: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputField(
                'Name',
                nameController,
                TextInputType.text,

                //             (value) => {
                // if (value == null || value.isEmpty) {
                //           return 'Please enter some text!';
                //         }
                //         return null;
                // },
                // (value) => setState(() {
                //       title = value;
                //     })),
              ),
              _buildInputField(
                'Description',
                descriptionController,
                TextInputType.text,

                //             (value) => {
                // if (value == null || value.isEmpty) {
                //           return 'Please enter some text!';
                //         }
                //         return null;
                // },
                // () => setState(() {
                //       title = descriptionController.text;
                //     })),
              ),
            ],
          ),
        ));
  }

  Widget _buildInputField(
    String label,
    TextEditingController textController,
    TextInputType textInputType,
    // String Function(String) validator,
    // String Function(String) setValue,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextFormField(
              controller: textController,
              // validator: validator,
              keyboardType: textInputType,
              onChanged: (value) {
                nameController.value = TextEditingValue(
                    text: value,
                    selection: TextSelection.fromPosition(
                      TextPosition(offset: value.length),
                    ));
                // setValue(value);
              },
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                border: const OutlineInputBorder(),
                // suffixIcon: IconButton(
                //   icon: Icons.clear_outlined,
                //   onPressed: () {},
                // )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> updateRoom(String id) {
    return FirebaseFirestore.instance
        .collection('rooms')
        .doc(id)
        .set({
          'title': title,
          'description': description,
          // 'imageUrl':
        })
        .then((value) => {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Creating Room')),
              )
            })
        .catchError((error) => print("Failed to create room: $error"));
  }
}
