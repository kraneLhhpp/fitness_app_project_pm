import 'package:flutter/material.dart';

class DotImage extends StatelessWidget {
  final bool isFocused;
  final double size;
  final Color focusedColor;
  final Color unfocusedColor;

  const DotImage({
    super.key,
    required this.isFocused,
    this.size = 12.0,
    this.focusedColor = Colors.white,
    this.unfocusedColor = Colors.white54,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: isFocused ? size * 1.5 : size,
      height: size,
      decoration: BoxDecoration(
        color: isFocused ? focusedColor : unfocusedColor,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
