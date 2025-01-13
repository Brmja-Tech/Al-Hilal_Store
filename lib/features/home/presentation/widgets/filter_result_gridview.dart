import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/widget/custom_title_text.dart';
import '../../../../core/widget/custome_subtitle_text.dart';

class FilterResultGridView extends StatelessWidget {
  const FilterResultGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFCFCFC),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Image.asset(Assets.assetsImgsImage),
                SubtitleTextWidget(
                    subText:
                        'AlHilal Jersey (Fans) - Season 2025 - Blue (Men)'),
                TitleTextWidget(
                  text: '999.00 AED',
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
