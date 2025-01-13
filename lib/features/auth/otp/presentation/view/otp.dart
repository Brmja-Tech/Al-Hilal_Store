import 'dart:async';

import 'package:alhilal_store/core/style/app_colors.dart';
import 'package:alhilal_store/core/widget/custom_back_button.dart';
import 'package:alhilal_store/core/widget/custom_buttons.dart';
import 'package:alhilal_store/core/widget/custom_title_text.dart';
import 'package:alhilal_store/core/widget/custome_subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  late Timer _timer;
  int _start = 30;

  void startTimer() {
    _start = 30; // Reset the timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            BackButtonWidget(

            ),
            SizedBox(height: 30.h),
            Center(
              child: TitleTextWidget(
                text: "OTP Verification",
                fontSize: 32,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            SubtitleTextWidget(
              subText: "Please check your email to see the verification code",
              fontSize: 18,
              color: const Color(0xff707B81),
            ),
            SizedBox(height: 50.h),
            TitleTextWidget(
              text: "OTP Code",
              fontSize: 21,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.normal,
            ),
            SizedBox(height: 20.h),
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: otpController,
              keyboardType: TextInputType.phone,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 50,
                fieldWidth: 50,
                activeColor: Color(0xff0D6EFD),
                selectedColor: Color(0xff0D6EFD),
                inactiveColor: Colors.grey,
              ),
              animationDuration: Duration(milliseconds: 300),
              onChanged: (value) {},
              onCompleted: (value) {
                print("Entered OTP: $value");
              },
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: "Verify",
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              textColor: Colors.white,
              backgroundColor: AppColors.primaryColor,
              fontSize: 14,
              width: w * 05,
              height: 50,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resend code in ',
                  style: TextStyle(
                    color: Color(0xff7D848D),
                  ),
                ),
                Text(
                  '00:${_start.toString().padLeft(2, '0')}',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
