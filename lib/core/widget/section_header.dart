import 'package:flutter/material.dart';

import 'custom_title_text.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TitleTextWidget(
          text: text,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
