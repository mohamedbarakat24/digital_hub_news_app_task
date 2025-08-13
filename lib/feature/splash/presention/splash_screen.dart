import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:digital_hub_news_app_task/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../onboarding/presentation/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 4000,

      splash: Image.asset(
        MyImages.mainLogo,
        width: 217.w,
        height: 66.h,
        fit: BoxFit.contain,
      ),
      backgroundColor: Colors.white,
      nextScreen: const OnboardingScreen(),
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(milliseconds: 1000),
    );
  }
}
