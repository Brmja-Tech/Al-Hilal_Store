import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorDot({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          if (isSelected)
            const Icon(
              Icons.check,
              color: Colors.white,
              size: 25,
            ),
        ],
      ),
    );
  }
}
