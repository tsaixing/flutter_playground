import 'package:flutter/material.dart';
import 'package:flutter_playground/categories/checklist/dummy_data.dart';

class ChecklistPage extends StatefulWidget {
  static const routeName = '/checklist';

  const ChecklistPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  final _items = DUMMY_CHECKLIST.toList();

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String title = routeArgs['title']!;
    final String description = routeArgs['description']!;
    final String backgroundImageUrl = routeArgs['backgroundImageUrl']!;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          flexibleSpace: Image(
            image: AssetImage(backgroundImageUrl),
            fit: BoxFit.cover,
          ),
        ),
        body: ReorderableListView(
          header: Text(description),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
          children: _items
              .map((data) => CheckboxListTile(
                    key: Key(data.id),
                    title: Text(data.label),
                    // secondary: const Icon(Icons.hambu),
                    selected: false,
                    value: false,
                    onChanged: (bool? value) {},
                  ))
              .toList(),
        ));
  }
}
