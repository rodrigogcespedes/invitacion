import 'package:flutter/material.dart';

class SquareTumbnailWidget extends StatelessWidget {
  const SquareTumbnailWidget({
    super.key,
    required this.imageURL,
    required this.size,
  });

  final String imageURL;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(
          imageURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
