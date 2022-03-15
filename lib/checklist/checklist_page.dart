import 'package:flutter/material.dart';
import 'package:flutter_playground/checklist/dummy_data.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared List')),
      body: ListView(
          children: DUMMY_CHECKLIST
              .map((data) => CheckboxListTile(
                    title: Text(data.label),
                    selected: false,
                    value: false,
                    onChanged: (bool? value) {},
                  ))
              .toList()),
    );
  }
}
