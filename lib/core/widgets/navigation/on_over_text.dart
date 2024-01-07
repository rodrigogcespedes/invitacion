import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class OnHoverText extends StatefulWidget {
  const OnHoverText({Key? key, required this.builder}) : super(key: key);
  final Widget Function(bool isHovered) builder;

  @override
  State<OnHoverText> createState() => _OnHoverTextState();
}

class _OnHoverTextState extends State<OnHoverText> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      ..translate(1, 0, 0)
      ..scale(1.05);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        curve: Sprung.overDamped,
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() => this.isHovered = isHovered);
}
