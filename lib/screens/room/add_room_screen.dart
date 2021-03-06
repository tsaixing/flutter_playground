import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddRoomScreen extends StatefulWidget {
  static const routeName = '/add_room';

  const AddRoomScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddRoomScreen> createState() => _AddRoomScreen();
}

class _AddRoomScreen extends State<AddRoomScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  String title = "";
  String? description;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Room'),
        actions: <Widget>[
          saveButton(),
        ],
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildUploadBackgroundImage(context),
            // TODO give option of selecting rando image from Unsplash endpoint: https://source.unsplash.com/random/?hiking/600/400
            // TODO save rando image to local and assign to db, don't forget to credit unsplash
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
              //     })
            ),
          ],
        ),
      ),
    );
  }

  Container buildUploadBackgroundImage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20), //padding of outer Container
      child: DottedBorder(
        color: Colors.grey,
        strokeWidth: 3,
        dashPattern: const [10, 6],
        child: SizedBox(
          height: 120,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                padding: const EdgeInsets.only(bottom: 30),
                icon: const Icon(Icons.image_outlined, size: 50),
                tooltip: 'Add Background Image',
                color: Colors.grey,
                onPressed: () {
                  // TODO
                  Navigator.of(context).pushNamed(
                    AddRoomScreen.routeName,
                  );
                },
              ),
              const Text(
                'Upload Background Image',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
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

  // TextFormField textFormField(
  //     String label,
  //     TextEditingController textController,
  //     TextInputType textInputType,
  //     IconData icon,
  //     Color iconColor,
  //     String Function(String) validator) {
  //   return TextFormField(
  //       decoration: const InputDecoration(
  //         border: OutlineInputBorder(),
  //         labelText: label,
  //       ),
  //       controller: _controller,
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return 'Please enter some text!';
  //         }
  //         return null;
  //       },
  //       onChanged: (value) {
  //         _controller.value = TextEditingValue(
  //             text: value,
  //             selection: TextSelection.fromPosition(
  //               TextPosition(offset: value.length),
  //             ));
  //         setValue(value);
  //       });
  // }

  IconButton saveButton() {
    return IconButton(
      icon: const Icon(Icons.save),
      tooltip: 'Save',
      onPressed: () {
        FirebaseFirestore.instance
            .collection('rooms')
            .add({
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
      },
    );
  }
}
