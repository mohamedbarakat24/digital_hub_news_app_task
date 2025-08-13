import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_bloc.dart';
import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_event.dart';
import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_state.dart';
import 'package:digital_hub_news_app_task/feature/home/presentation/widgets/category_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildCategorySection extends StatelessWidget {
  const BuildCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return CategorySection(
          selectedCategory: state.category,
          onCategorySelected: (category) {
            context.read<NewsBloc>().add(NewsCategorySelected(category));
          },
          categories: const [
            'All',
            'Sports',
            'Politics',
            'Business',
            'Health',
            'Science',
          ],
        );
      },
    );
  }
}
