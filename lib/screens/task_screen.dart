import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  static const routeName = '/task';

  const TaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
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
        title: Text(parentTitle + ": " + taskTitle),
        flexibleSpace: Image(
          image: AssetImage(backgroundImageUrl),
          fit: BoxFit.cover,
        ),
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
}
