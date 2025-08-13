import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/core/constants/image_strings.dart';
import 'package:digital_hub_news_app_task/feature/home/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      title: Image.asset(
        MyImages.mainLogo,
        fit: BoxFit.cover,
        height: 33.h,
        width: 120.w,
      ),
      actions: [
        Container(
          width: 32.w,
          height: 32.h,
          margin: EdgeInsets.only(right: 8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 0),
                spreadRadius: 0,
              ),
            ],
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.search, color: MyColors.textBodyGrey, size: 20.sp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ),
        Container(
          width: 32.w,
          height: 32.h,
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 0),
                spreadRadius: 0,
              ),
            ],
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.notifications_outlined,
              color: MyColors.textBodyGrey,
              size: 20.sp,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
