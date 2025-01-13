import 'package:alhilal_store/core/constants/assets.dart';
import 'package:alhilal_store/core/style/app_colors.dart';
import 'package:alhilal_store/core/widget/custom_back_button.dart';
import 'package:alhilal_store/core/widget/custom_buttons.dart';
import 'package:alhilal_store/core/widget/custom_text_field.dart';
import 'package:alhilal_store/core/widget/custom_title_text.dart';
import 'package:alhilal_store/core/widget/custome_subtitle_text.dart';
import 'package:alhilal_store/features/auth/forget_password/presentation/view/forget_password.dart';
import 'package:alhilal_store/features/auth/sign_up/presentation/view/signup_screen.dart';
import 'package:alhilal_store/features/onboarding/presentation/view/started_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:svg_flutter/svg_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFoucsNode = FocusNode();
  final FocusNode _passwordFoucsNode = FocusNode();
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const StartedScreen();
        },
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              BackButtonWidget(),
              SizedBox(height: 30),
              Center(
                child: TitleTextWidget(
                  text: "Hello Again!",
                  fontSize: 32,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              SubtitleTextWidget(
                subText: "Fill Your Details Or Continue With Social Media",
                fontSize: 18,
                color: Color(0xff707B81),
              ),
              SizedBox(
                height: 50,
              ),
              SubtitleTextWidget(
                subText: "Email Address",
                fontSize: 16,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                controller: _emailController,
                focusNode: _emailFoucsNode,
                hintText: "example@example.com",
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                ),
              ),
              SizedBox(height: 30),
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
                hintText: "***********",
                keyboardType: TextInputType.name,
                obscureText: obscureText,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
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
              SizedBox(height: 5),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgetPassword();
                        },
                      ),
                    );
                  },
                  child: SubtitleTextWidget(
                    subText: "Forget Password?",
                    color: Color(0xff707B81),
                    fontSize: 12,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                text: "Sign in",
                textColor: Colors.white,
                backgroundColor: AppColors.primaryColor,
                fontSize: 14,
                onPressed: () {},
                width: w * 05,
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
                      text: 'New User? ',
                      style: TextStyle(
                        color: Color(0xff6A6A6A),
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'Create Account',
                          style: TextStyle(
                            color: Color(0xff1A1D1E),
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
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
    );
  }
}
