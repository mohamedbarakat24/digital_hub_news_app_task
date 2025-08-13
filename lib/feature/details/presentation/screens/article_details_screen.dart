import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/feature/details/presentation/widgets/build_details_section.dart';
import 'package:digital_hub_news_app_task/feature/details/presentation/widgets/open_artical_url_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/data/models/article_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final ArticleModel article;
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: MyColors.textBodyGrey,
            size: 24.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.share_outlined,
                  color: MyColors.textBodyGrey,
                  size: 24.sp,
                ),
                onPressed: () {},
              ),

              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.more_horiz,
                  color: MyColors.textBodyGrey,
                  size: 24.sp,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: OpenArticleUrlButton(article: article),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: BuildDetailsSection(article: article),
      ),
    );
  }
}
