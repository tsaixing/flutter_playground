import 'package:flutter/material.dart';

class ItemDetailPage extends StatefulWidget {
  static const routeName = '/item';

  const ItemDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
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
