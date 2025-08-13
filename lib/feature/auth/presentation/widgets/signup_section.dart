import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/feature/auth/logic/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupSection extends StatelessWidget {
  final AuthController controller;
  const SignupSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'don\'t have an account ?',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: MyColors.textBodyGrey,
            height: 21 / 14,
            letterSpacing: 0.12,
            fontFamily: 'Poppins',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 14.sp,
              color: MyColors.primaryColor,
              fontWeight: FontWeight.w400,
              height: 21 / 14,
              letterSpacing: 0.12,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }
}
