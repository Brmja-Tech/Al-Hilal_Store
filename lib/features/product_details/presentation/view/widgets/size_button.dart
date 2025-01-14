import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeButton({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.pink[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            size,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
