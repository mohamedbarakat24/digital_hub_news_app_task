import 'package:digital_hub_news_app_task/feature/home/presentation/widgets/build_category_section.dart';
import 'package:digital_hub_news_app_task/feature/home/presentation/widgets/build_news_section.dart';
import 'package:digital_hub_news_app_task/feature/home/presentation/widgets/custom_app_bar.dart';
import 'package:digital_hub_news_app_task/feature/home/presentation/widgets/headline_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          // Latest and see all  Section
          const HeadlineSection(),
          SizedBox(height: 16.h),
          // category Section
          const BuildCategorySection(),
          // Show The News Section
          const BuildNewsSection(),
        ],
      ),
    );
  }
}
