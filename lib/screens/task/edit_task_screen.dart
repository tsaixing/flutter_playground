import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  static const routeName = '/edit_task';

  const EditTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String taskId = routeArgs['id']!;
    final String parentTitle = routeArgs['parentTitle']!;
    final String taskTitle = routeArgs['taskTitle']!;
    final String backgroundImageUrl = routeArgs['backgroundImageUrl']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(taskTitle),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              parentTitle,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: AssetImage(backgroundImageUrl),
            ),
          ),
        ),
        actions: <Widget>[
          saveButton(),
        ],
      ),
      body: fetchTask(taskId),
    );
  }

  StreamBuilder fetchTask(String taskId) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong!');
        }

        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else {
          return Container(); // TODO implement list of images to view, and notes
        }
      },
    );
  }

  IconButton saveButton() {
    return IconButton(
      icon: const Icon(Icons.save),
      tooltip: 'Save',
      onPressed: () {
        FirebaseFirestore.instance
            .collection('tasks')
            .add({
              // 'title': title,
              // 'description': description,
              // 'imageUrl':
            })
            .then((value) => {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Saving Task')),
                  )
                })
            .catchError((error) => print("Failed to create room: $error"));
      },
    );
  }
}
