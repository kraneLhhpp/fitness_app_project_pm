import 'package:flutter/material.dart';

class DotImage extends StatelessWidget{
  final bool isFocused;
  const DotImage({super.key, required this.isFocused});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFocused ? 20 : 15,
      height: isFocused ? 20 : 15,
      decoration: BoxDecoration(
        color: isFocused ? Colors.white : Color(0xFFD1E6FF),
        shape: BoxShape.circle
      ),
    );
  }
}