import 'package:alhilal_store/core/constants/assets.dart';
import 'package:alhilal_store/core/widget/custom_buttons.dart';
import 'package:alhilal_store/core/widget/custome_subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAlertDiaglo extends StatelessWidget {
  final String? image;
  final String? message;
  final String? title;
  final String? buttonText;
  final String? svgImage;
  final VoidCallback onContinue;
  const CustomAlertDiaglo({
    super.key,
    this.image,
    this.message,
    required this.onContinue,
    this.buttonText,
    this.svgImage,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xffF7F7F7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 320.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsImgsDialogPlayer,
              width: 200.w,
              height: 150.h,
            ),
            SizedBox(height: 20.h),
            SubtitleTextWidget(
              subText: message!,
              fontSize: 16.sp,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: buttonText!,
              onPressed: onContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
