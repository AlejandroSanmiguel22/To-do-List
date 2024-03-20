import 'package:flutter/material.dart';

class TextH2 extends StatelessWidget {
  const TextH2(this.text,{super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}

