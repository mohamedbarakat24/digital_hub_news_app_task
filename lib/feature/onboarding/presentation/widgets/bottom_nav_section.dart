import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../logic/onboarding_controller.dart';

class BottomNavSection extends StatelessWidget {
  final OnboardingController controller;

  const BottomNavSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Page indicators
          Row(
            children: List.generate(
              controller.totalPages,
              (index) => Obx(
                () => Container(
                  margin: EdgeInsets.only(right: 8.w),
                  width: 14.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color:
                        controller.currentPage.value == index
                            ? MyColors.primaryColor
                            : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),

          // Navigation buttons
          Obx(() {
            //  First page
            if (controller.currentPage.value == 0) {
              return ElevatedButton(
                onPressed: controller.nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 13.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    height: 24 / 16,
                    letterSpacing: 0.12,
                    fontFamily: 'Poppins',
                  ),
                ),
              );
            } else if (controller.currentPage.value ==
                controller.totalPages - 1) {
              // Last page
              return Row(
                children: [
                  TextButton(
                    onPressed: controller.previousPage,
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: MyColors.textBodyGrey,
                        fontWeight: FontWeight.w600,
                        height: 24 / 16,
                        letterSpacing: 0.12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: controller.nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primaryColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 13.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 24 / 16,
                        fontFamily: 'Poppins',
                        letterSpacing: 0.12,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              // Middle page
              return Row(
                children: [
                  TextButton(
                    onPressed: controller.previousPage,
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: MyColors.textBodyGrey,
                        fontWeight: FontWeight.w600,
                        height: 24 / 16,
                        letterSpacing: 0.12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  ElevatedButton(
                    onPressed: controller.nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primaryColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 24 / 16,
                        letterSpacing: 0.12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
