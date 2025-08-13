import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/feature/auth/logic/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RememberMeSection extends StatelessWidget {
  final AuthController controller;
  const RememberMeSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(
              () => Transform.scale(
                scale: 0.9,
                child: Checkbox(
                  value: controller.rememberMe.value,
                  onChanged: (bool? value) {
                    controller.toggleRememberMe(value);
                  },
                  activeColor: MyColors.primaryColor,
                  side: BorderSide(color: Colors.grey[400]!, width: 1.5.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              'Remember me',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: MyColors.textBodyGrey,
                height: 21 / 14,
                letterSpacing: 0.12,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Forgot the password ?',
            style: TextStyle(
              fontSize: 14.sp,
              color: MyColors.secondaryRememberme,
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
