import 'package:flutter/material.dart';

import './list_type/type_page.dart';

void main() => runApp(const SharedList());

class SharedList extends StatefulWidget {
  const SharedList({Key? key}) : super(key: key);

  @override
  State<SharedList> createState() => _SharedListState();
}

class _SharedListState extends State<SharedList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Shared List')),
        body: const TypePage(),
      ),
    );
  }
}
