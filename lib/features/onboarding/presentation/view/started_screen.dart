import 'package:alhilal_store/core/constants/assets.dart';
import 'package:alhilal_store/core/widget/custom_buttons.dart';
import 'package:alhilal_store/core/widget/custom_title_text.dart';
import 'package:alhilal_store/core/widget/custome_subtitle_text.dart';
import 'package:alhilal_store/features/auth/login/presentation/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  String? selectedLanguage;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 180),
            Image.asset(
              Assets.assetsImgsIcon,
              height: w * 0.4,
              width: w * 0.4,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 15),
            TitleTextWidget(
              text: "ALHILAL STORE",
              fontSize: 36,
            ),
            SizedBox(height: 10),
            SubtitleTextWidget(
              subText: "Easy shopping experience for trending clothes",
              fontSize: 19,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 70),
            CustomButton(
              text: "Let's get Started",
              backgroundColor: Color(0xff0D6EFD),
              fontSize: 22,
              onPressed: selectedLanguage == null
                  ? null
                  : () async {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false,
                      );
                      // GoogleSignIn googleSignIn = GoogleSignIn();
                      // googleSignIn.disconnect();
                      // googleSignIn.signOut();
                      // await FirebaseAuth.instance.signOut();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return const LoginScreen();
                      //     },
                      //   ),
                      // );
                    },
              width: w * 05,
              height: 60,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    text: "English",
                    onPressed: () {
                      setState(() {
                        selectedLanguage = "English";
                      });
                    },
                    fontSize: 22,
                    textColor: selectedLanguage == "English"
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: selectedLanguage == "English"
                        ? Color(0xff6AA5FC)
                        : Colors.white,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                    child: CustomButton(
                  text: "العربية",
                  onPressed: () {
                    setState(() {
                      selectedLanguage = "Arabic";
                    });
                  },
                  fontSize: 22,
                  textColor: selectedLanguage == "Arabic"
                      ? Colors.white
                      : Colors.black,
                  backgroundColor: selectedLanguage == "Arabic"
                      ? Color(0xff6AA5FC)
                      : Colors.white,
                )),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
