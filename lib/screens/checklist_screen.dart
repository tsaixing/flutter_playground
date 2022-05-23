import 'package:flutter/material.dart';
import 'package:flutter_playground/temp_data/checklist.dart';

class ChecklistScreen extends StatefulWidget {
  static const routeName = '/checklist';

  const ChecklistScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
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
