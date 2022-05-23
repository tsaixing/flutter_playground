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
    final String title = routeArgs['title']!;
    // final String description = routeArgs['description']!;
    final String backgroundImageUrl = routeArgs['backgroundImageUrl']!;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          flexibleSpace: Image(
            image: AssetImage(backgroundImageUrl),
            fit: BoxFit.cover,
          ),
        ),
        body: Container());
  }
}
