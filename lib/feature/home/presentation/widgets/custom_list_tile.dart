import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/feature/home/data/models/article_model.dart';
import 'package:digital_hub_news_app_task/feature/home/presentation/widgets/channal_section.dart';
import 'package:digital_hub_news_app_task/feature/home/presentation/widgets/time_format_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.article,
    required this.onTap,
    this.isLoading = false,
  });

  final ArticleModel article;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildShimmerEffect();
    }

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    article.imageUrl ?? '',
                    width: 96.w,
                    height: 96.h,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (_, __, ___) => Image.asset(
                          "assets/images/breaking_news.png",
                          width: 96.w,
                          height: 96.h,
                          fit: BoxFit.cover,
                        ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.category?.toUpperCase() ?? 'NEWS',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: MyColors.textBodyGrey,
                          height: 19.5 / 13,
                          letterSpacing: 0.12,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        article.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          height: 24 / 16,
                          letterSpacing: 0.12,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ChannalSection(article: article),
                              SizedBox(width: 12.w),
                              TimeFormatSection(article: article),
                            ],
                          ),
                          Icon(
                            Icons.more_horiz_rounded,
                            size: 16.sp,
                            color: MyColors.textBodyGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            Container(
              width: 96.w,
              height: 96.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 60.w, height: 12.h, color: Colors.white),
                  SizedBox(height: 8.h),
                  Container(
                    width: double.infinity,
                    height: 16.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: double.infinity,
                    height: 16.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.h,
                            color: Colors.white,
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 60.w,
                            height: 13.h,
                            color: Colors.white,
                          ),
                          SizedBox(width: 12.w),
                          Container(
                            width: 40.w,
                            height: 13.h,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Container(width: 16.w, height: 16.h, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
