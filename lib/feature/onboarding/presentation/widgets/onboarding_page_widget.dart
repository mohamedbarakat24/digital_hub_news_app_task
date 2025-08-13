import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;

  const OnboardingPageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Image
        Image.asset(page.image, width: double.infinity, height: 584.h),
        SizedBox(height: 24.h),

        //  Title and Description
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                page.title,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: MyColors.black,
                  height: 36 / 24,
                  letterSpacing: 0.12,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),

              Text(
                page.description,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: MyColors.textBodyGrey,
                  height: 24 / 16,
                  letterSpacing: 0.12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
