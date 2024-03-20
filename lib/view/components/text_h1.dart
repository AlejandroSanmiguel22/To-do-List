import 'package:flutter/material.dart';

class TextH1 extends StatelessWidget {
  const TextH1(
    this.text, {
    Key? key,
    this.color,
  }) : super(key: key);
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }
}
