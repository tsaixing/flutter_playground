import 'package:flutter/material.dart';

void main() => runApp(SharedList());

class SharedList extends StatefulWidget {
  @override
  State<SharedList> createState() => _SharedListState();
}

class _SharedListState extends State<SharedList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Shared List')),
        body: GridView.count(crossAxisCount: 2, children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit
                      .cover, //I assumed you want to occupy the entire space of the card
                  image: AssetImage('assets/restaurants.jpeg'),
                ),
              ),
              child: const ListTile(
                leading: Text(
                  'Testing the ListTile',
                  style: TextStyle(color: Colors.white),
                ),
                title: Text(
                  'Testing again!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with leading widget'),
            ),
          ),
        ]),
      ),
    );
  }
}
