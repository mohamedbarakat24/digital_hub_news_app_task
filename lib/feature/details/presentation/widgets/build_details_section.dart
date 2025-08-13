import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/core/constants/image_strings.dart';
import 'package:digital_hub_news_app_task/feature/home/data/models/article_model.dart';
import 'package:digital_hub_news_app_task/feature/home/presentation/widgets/time_format_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildDetailsSection extends StatelessWidget {
  final ArticleModel article;
  const BuildDetailsSection({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              Image.asset(
                MyImages.bbcLogo,
                width: 50.w,
                height: 50.h,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.sourceName.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: 24 / 16,
                      letterSpacing: 0.12,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TimeFormatSection(article: article),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        if (article.imageUrl != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              article.imageUrl!,
              width: double.infinity,
              height: 200.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/breaking_news.png',
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                );
              },
            ),
          )
        else
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              'assets/images/breaking_news.png',
              width: double.infinity,
              height: 200.h,
              fit: BoxFit.cover,
            ),
          ),
        SizedBox(height: 16.h),

        Text(
          article.category?.toUpperCase() ?? 'NEWS',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
            color: MyColors.textBodyGrey,
            height: 21 / 14,
            letterSpacing: 0.12,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          article.title,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            height: 36 / 24,
            letterSpacing: 0.12,
            fontFamily: 'Poppins',
            color: MyColors.blackText,
          ),
        ),
        SizedBox(height: 8.h),

        Text(
          article.description ?? 'No description available',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            height: 24 / 16,
            letterSpacing: 0.12,
            fontFamily: 'Poppins',
            color: MyColors.textBodyGrey,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'By ${article.author ?? 'Unknown'}',
          style: TextStyle(fontSize: 14.sp, color: MyColors.textBodyGrey),
        ),
      ],
    );
  }
}
