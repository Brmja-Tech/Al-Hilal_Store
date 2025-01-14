import 'dart:developer';

import 'package:alhilal_store/core/constants/assets.dart';
import 'package:alhilal_store/core/constants/validator.dart';
import 'package:alhilal_store/core/router/app_router.dart';
import 'package:alhilal_store/core/style/app_colors.dart';
import 'package:alhilal_store/core/widget/custom_alert_diaglo.dart';
import 'package:alhilal_store/core/widget/custom_back_button.dart';
import 'package:alhilal_store/core/widget/custom_buttons.dart';
import 'package:alhilal_store/core/widget/custom_text_field.dart';
import 'package:alhilal_store/core/widget/custom_title_text.dart';
import 'package:alhilal_store/core/widget/custome_subtitle_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:svg_flutter/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureText = true;
  bool obscureTextConfirm = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _nameFoucsNode = FocusNode();
  final FocusNode _phoneFoucsNode = FocusNode();
  final FocusNode _emailFoucsNode = FocusNode();
  final FocusNode _passwordFoucsNode = FocusNode();
  final FocusNode _confirmPasswordFoucsNode = FocusNode();

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      GoRouter.of(context).push(
        AppRouters.kforgetPasswordScreen,
      );
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: BackButtonWidget(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [                      
                      SizedBox(height: 30.h),
                      Center(
                        child: TitleTextWidget(
                          text: "Register Account",
                          fontSize: 32,
                          textAlign: TextAlign.center,fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      SubtitleTextWidget(
                        subText: "Fill your details Or Continue With Social Media",
                        fontSize: 18,
                        color: const Color(0xff707B81),
                      ),
                      SizedBox(height: 50),
                      SubtitleTextWidget(
                        subText: "Your Name",
                        fontSize: 16,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _nameController,
                        focusNode: _nameFoucsNode,
                        validator: MyValidators.displayNameValidator,
                        hintText: "Enter your Name",
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(height: 15),
                      SubtitleTextWidget(
                        subText: "Country",
                        textAlign: TextAlign.start,
                        fontSize: 16,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      IntlPhoneField(
                        controller: _phoneController,
                        focusNode: _phoneFoucsNode,
                        disableAutoFillHints :false,
                        languageCode: 'ar',
                        textAlign: TextAlign.left,
                        //validator: MyValidators.phoneNumberValidator(pho),
                        decoration: InputDecoration(
                          // labelText: 'Phone Number',
                          prefixIcon: const Icon(Icons.phone),
                        ),
                        initialCountryCode: 'EG',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      // CustomTextField(
                      //   controller: _phoneController,
                      //   focusNode: _phoneFoucsNode,
                      //   validator: MyValidators.phoneNumberValidator,
                      //   hintText: "Enter your Phone",
                      //   keyboardType: TextInputType.phone,
                      //   decoration: const InputDecoration(
                      //     prefixIcon: Icon(Icons.phone),
                      //   ),
                      // ),
                      SizedBox(height: 15),
                      SubtitleTextWidget(
                        subText: "Email Address",
                        textAlign: TextAlign.start,
                        fontSize: 16,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        focusNode: _emailFoucsNode,
                        validator: MyValidators.emailValidator,
                        hintText: "example@example.com",
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 15),
                      SubtitleTextWidget(
                        subText: "Password",
                        textAlign: TextAlign.start,
                        fontSize: 16,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        focusNode: _passwordFoucsNode,
                        validator: MyValidators.passwordValidator,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: obscureText,
                        hintText: "***********",
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(
                              obscureText ? Icons.visibility : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SubtitleTextWidget(
                        subText: "Retype Password",
                        textAlign: TextAlign.start,
                        fontSize: 16,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _confirmPasswordController,
                        focusNode: _confirmPasswordFoucsNode,
                        validator: (value) => MyValidators.repeatPasswordValidator(
                          Password: _passwordController.text,
                          value: value,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: obscureTextConfirm,
                        hintText: "***********",
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureTextConfirm = !obscureTextConfirm;
                              });
                            },
                            icon: Icon(
                              obscureTextConfirm
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      CustomButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        text: "Sign up",
                        textColor: Colors.white,
                        backgroundColor: AppColors.primaryColor,
                        fontSize: 14,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomAlertDiaglo(
                              image: Assets.assetsImgsDialogPlayer,
                              message: 'Account created is successfully',
                              onContinue: () {
                                GoRouter.of(context)
                                    .push(AppRouters.koptScreen);
                              },
                              buttonText: "Continue",
                            ),
                          );
                        },
                        width: w * 1.0,
                        height: 50,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          signInWithGoogle();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(w * 05, 50),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.assetsIconGoogle),
                            SizedBox(
                              width: 15,
                            ),
                            SubtitleTextWidget(
                              subText: "Sign in With Google",
                              fontSize: 14,
                              color: Color(0xff2B2B2B),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 70),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Already Have Account? ',
                              style: TextStyle(
                                color: Color(0xff6A6A6A),
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: Color(0xff1A1D1E),
                                    fontSize: 16,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      GoRouter.of(context).push(
                                        AppRouters.kloginRoute,
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
