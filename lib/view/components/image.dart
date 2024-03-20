import 'package:flutter/material.dart';

class Imag extends StatelessWidget {
  const Imag(this.image, this.width, this.height, {super.key});

  final String image;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: width,
      height: height,
    );
  }
}
