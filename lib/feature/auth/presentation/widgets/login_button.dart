import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/feature/auth/logic/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButtonSection extends StatelessWidget {
  final AuthController controller;
  const LoginButtonSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: controller.login,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            height: 24 / 16,
            letterSpacing: 0.12,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
