import 'package:alhilal_store/core/widget/custome_subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonWidget extends StatelessWidget {
  final Color iconColor;
  final Color backgroundColor;
  final double size;

  const BackButtonWidget({
    super.key,
    this.iconColor = Colors.black,
    this.backgroundColor = const Color.fromARGB(255, 222, 220, 220),
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pop();
      },
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SubtitleTextWidget(
            subText: "<",
            color: iconColor,
            fontSize: size * 0.6,
          ),
        ),
      ),
    );
  }
}
