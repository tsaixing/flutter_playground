import 'package:flutter/material.dart';

class TypeCard extends StatelessWidget {
  final String cardTitle;
  final String backgroundImageUrl;

  const TypeCard({
    Key? key,
    required this.cardTitle,
    required this.backgroundImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(backgroundImageUrl),
          ),
        ),
        child: Flexible(
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
                    cardTitle,
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
