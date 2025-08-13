import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadlineSection extends StatelessWidget {
  const HeadlineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Latest",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              height: 24 / 16,
            ),
          ),

          Text(
            "See all",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              height: 21 / 16,
              letterSpacing: 0.12,
            ),
          ),
        ],
      ),
    );
  }
}
