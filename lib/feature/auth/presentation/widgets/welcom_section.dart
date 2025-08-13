import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w700,
              color: MyColors.blackText,
              height: 72 / 48,
              letterSpacing: 0.12,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Again!',
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w700,
              color: MyColors.primaryColor,
              height: 72 / 48,
              letterSpacing: 0.12,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Welcome back you\'ve been missed',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.textBodyGrey,
              height: 30 / 20,
              letterSpacing: 0.12,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
