import 'package:alhilal_store/core/constants/assets.dart';
import 'package:alhilal_store/core/style/app_colors.dart';
import 'package:alhilal_store/core/widget/custom_back_button.dart';
import 'package:alhilal_store/core/widget/custom_buttons.dart';
import 'package:alhilal_store/core/widget/custom_text_field.dart';
import 'package:alhilal_store/core/widget/custom_title_text.dart';
import 'package:alhilal_store/core/widget/custome_subtitle_text.dart';
import 'package:alhilal_store/features/auth/login/presentation/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:svg_flutter/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureText = true;
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
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
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
                  text: "Register Account",
                  fontSize: 32,
                  textAlign: TextAlign.center,
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
              CustomTextField(
                controller: _phoneController,
                focusNode: _phoneFoucsNode,
                hintText: "Enter your Phone",
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
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
                onPressed: () {},
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
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                                (route) => false,
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



