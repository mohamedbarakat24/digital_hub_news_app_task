import 'package:digital_hub_news_app_task/core/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySection extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;
  final List<String> categories;

  const CategorySection({
    Key? key,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected =
              category.toLowerCase() == selectedCategory.toLowerCase();

          return GestureDetector(
            onTap: () => onCategorySelected(category.toLowerCase()),
            child: Container(
              margin: EdgeInsets.only(right: 14.w, left: 6.w),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                        isSelected ? MyColors.primaryColor : Colors.transparent,
                    width: 2.h,
                  ),
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: MyColors.textBodyGrey,
                  fontSize: 16.sp,
                  fontFamily: 'Poppins',
                  height: 24 / 16,
                  letterSpacing: 0.12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
