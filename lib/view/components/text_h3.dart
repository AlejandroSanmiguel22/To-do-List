import 'package:flutter/material.dart';

class TextH3 extends StatelessWidget {
  const TextH3(this.text,{super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: "Schyler",
        fontSize: 15.5,
        color: Colors.black
      ),
    );
  }
}