import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/feature/auth/logic/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginFormSection extends StatelessWidget {
  final AuthController controller;

  const LoginFormSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Username Field
        Row(
          children: [
            Text(
              'Username',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: MyColors.blackText,
                height: 21 / 14,
                letterSpacing: 0.12,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              '*',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.red,
                height: 21 / 14,
                letterSpacing: 0.12,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        TextFormField(
          cursorColor: MyColors.primaryColor,

          controller: controller.usernameController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Username is required';
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color: Colors.blue),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            errorStyle: TextStyle(color: Colors.red, fontSize: 12.sp),
          ),
        ),

        SizedBox(height: 16.h),

        // Password Field
        Row(
          children: [
            Text(
              'Password',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: MyColors.blackText,
                height: 21 / 14,
                letterSpacing: 0.12,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              '*',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.red,
                height: 21 / 14,
                letterSpacing: 0.12,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Obx(
          () => TextFormField(
            controller: controller.passwordController,
            obscureText: !controller.isPasswordVisible.value,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: BorderSide(color: Colors.blue),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordVisible.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey[600],
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
              errorStyle: TextStyle(color: Colors.red, fontSize: 12.sp),
            ),
          ),
        ),
      ],
    );
  }
}
