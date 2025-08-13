import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButtonSection extends StatelessWidget {
  const SocialButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'or continue with',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: MyColors.textBodyGrey,
                  height: 21 / 14,
                  letterSpacing: 0.12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 24.h),

        Row(
          children: [
            // Facebook Button
            Expanded(
              child: SizedBox(
                height: 48.h,
                width: 174.w,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    MyImages.facebookLogo,
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: Text(
                    'Facebook',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xFF667080),
                      fontWeight: FontWeight.w600,
                      height: 24 / 16,
                      letterSpacing: 0.12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffEEF1F4),
                    foregroundColor: Color(0xFF667080),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(width: 31.w),

            // Google Button
            Expanded(
              child: SizedBox(
                height: 48.h,
                width: 174.w,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    MyImages.googleLogo,
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: Text(
                    'Google',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xFF667080),
                      fontWeight: FontWeight.w600,
                      height: 24 / 16,
                      letterSpacing: 0.12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffEEF1F4),
                    foregroundColor: Color(0xFF667080),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
