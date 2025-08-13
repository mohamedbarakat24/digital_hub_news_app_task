import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/feature/home/data/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeFormatSection extends StatelessWidget {
  final ArticleModel article;
  const TimeFormatSection({super.key, required this.article});

  String _getTimeAgo(DateTime? dateTime) {
    if (dateTime == null) return '';

    final difference = DateTime.now().difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, size: 14.sp, color: MyColors.textBodyGrey),
        SizedBox(width: 2.w),
        Text(
          _getTimeAgo(article.publishedAt),
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
            height: 19.5 / 13,
            letterSpacing: 0.12,
            color: MyColors.textBodyGrey,
          ),
        ),
      ],
    );
  }
}
