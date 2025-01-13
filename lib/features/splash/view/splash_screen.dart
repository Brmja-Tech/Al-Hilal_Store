import 'package:alhilal_store/core/constants/assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          Assets.assetsImgsSplashScreen,
          fit: BoxFit.fitHeight,
          width: double.infinity,
        ),
      ),
    );
  }
}
