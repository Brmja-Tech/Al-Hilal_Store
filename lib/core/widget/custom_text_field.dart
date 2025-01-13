// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLength;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final bool? showCursor;
  final int? maxLines = 1;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? border;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.hintStyle,
    this.onChanged,
    this.readOnly = false,
    this.showCursor,
    this.mouseCursor,
    this.focusNode,
    this.decoration,
    this.prefixIcon,
    this.suffixIcon,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLength: maxLength,
        readOnly: readOnly,
        onChanged: onChanged,
        decoration: decoration?.copyWith(
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyle(color: Colors.grey),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: decoration?.border ?? InputBorder.none,
        ),
      ),
    );
  }
}
