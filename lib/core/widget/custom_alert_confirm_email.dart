import 'package:alhilal_store/core/router/app_router.dart';
import 'package:alhilal_store/core/style/app_colors.dart';
import 'package:alhilal_store/core/widget/custom_title_text.dart';
import 'package:alhilal_store/core/widget/custome_subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAlertConfirmation extends StatelessWidget {
  final String? image;
  final String? title;
  final String? message;
  final String? buttonText;
  final VoidCallback onContinue;
  const CustomAlertConfirmation({
    super.key,
    this.image,
    this.message,
    this.title,
    required this.onContinue,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Icon(
                Icons.email_outlined,
                color: Colors.white,
                size: 30,
              )
                  ),
            ),
            const SizedBox(height: 20),
            TitleTextWidget(
              text: title!,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 10.h),
            SubtitleTextWidget(
              subText: message!,
              textAlign: TextAlign.center,
              fontSize: 14,
              color: AppColors.hintTextColor,
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pop();
                GoRouter.of(context).push(AppRouters.koptScreen);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(80, 30),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: SubtitleTextWidget(
                subText: buttonText!,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
