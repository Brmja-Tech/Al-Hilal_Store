import 'package:alhilal_store/core/constants/assets.dart';
import 'package:alhilal_store/core/constants/validator.dart';
import 'package:alhilal_store/core/router/app_router.dart';
import 'package:alhilal_store/core/style/app_colors.dart';
import 'package:alhilal_store/core/widget/custom_alert_confirm_email.dart';
import 'package:alhilal_store/core/widget/custom_back_button.dart';
import 'package:alhilal_store/core/widget/custom_buttons.dart';
import 'package:alhilal_store/core/widget/custom_text_field.dart';
import 'package:alhilal_store/core/widget/custom_title_text.dart';
import 'package:alhilal_store/core/widget/custome_subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFoucsNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            BackButtonWidget(),
            SizedBox(height: 30),
            Center(
              child: TitleTextWidget(
                text: "Forgot Password",
                fontSize: 32,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            SubtitleTextWidget(
              subText: "Enter your Email Account To Teset Your Password",
              fontSize: 18,
              color: const Color(0xff707B81),
            ),
            SizedBox(height: 50),
            CustomTextField(
              controller: _emailController,
              validator: MyValidators.emailValidator,
              focusNode: _emailFoucsNode,
              hintText: 'xxxxxxxxxx',
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none)),
            ),
            SizedBox(height: 30),
            CustomButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              text: "Reset Password",
              textColor: Colors.white,
              backgroundColor: AppColors.primaryColor,
              fontSize: 14,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CustomAlertConfirmation(
                    image: Assets.assetsIconEmail,
                    title: "Check your email",
                    message:
                        'We have send password recovery code in your email',
                    onContinue: () {
                      GoRouter.of(context)
                          .push(AppRouters.koptScreen);
                    },
                    buttonText: "Ok",
                  ),
                );
                // GoRouter.of(context).pushReplacement(AppRouters.koptScreen);
              },
              width: w * 05,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
