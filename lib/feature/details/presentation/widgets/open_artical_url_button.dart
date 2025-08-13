import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/feature/home/data/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenArticleUrlButton extends StatelessWidget {
  final ArticleModel article;
  const OpenArticleUrlButton({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 13.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SizedBox(
        width: 379.w,
        height: 50.h,
        child: ElevatedButton(
          onPressed: _launchUrl,
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,

            padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 24.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
          child: Text(
            'Open Article',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Colors.white,
              height: 24 / 16,
              letterSpacing: 0.12,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (article.url == null) return;
    final Uri url = Uri.parse(article.url!);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch ${article.url}');
    }
  }
}
