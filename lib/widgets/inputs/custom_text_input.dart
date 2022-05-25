import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;

  const CustomTextInput({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
