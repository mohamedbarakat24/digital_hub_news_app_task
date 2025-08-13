import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/core/constants/image_strings.dart';
import 'package:digital_hub_news_app_task/feature/home/data/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChannalSection extends StatelessWidget {
  final ArticleModel article;
  const ChannalSection({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          MyImages.bbcLogo,
          width: 20.w,
          height: 20.h,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 4.w),
        Text(
          article.sourceName ?? 'Article Details',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: MyColors.textBodyGrey,

            letterSpacing: 0.12,
          ),
        ),
      ],
    );
  }
}
