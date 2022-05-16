import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/checklist_screen.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String description;
  final String backgroundImageUrl;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.backgroundImageUrl,
    this.description = "",
  }) : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(ChecklistScreen.routeName, arguments: {
      'title': title,
      'description': description,
      'backgroundImageUrl': backgroundImageUrl,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      // borderRadius: BorderRadius.circular(15),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(backgroundImageUrl),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: .3,
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.black.withOpacity(0.55)),
                // width: double.infinity,
                height: 5,
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
