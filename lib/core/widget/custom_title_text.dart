import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.text,
    this.fontSize = 20,
    this.color,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.fontWeight,
  });

  final String text;
  final double fontSize;
  final Color? color;
  final int? maxLines;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: TextAlign.center,
      style: GoogleFonts.dmSans(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
