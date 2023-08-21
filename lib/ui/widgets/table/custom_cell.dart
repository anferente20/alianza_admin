import 'package:flutter/material.dart';

class CustomCell extends StatelessWidget {
  const CustomCell({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(text, style: const TextStyle(fontSize: 14))]),
    );
  }
}
