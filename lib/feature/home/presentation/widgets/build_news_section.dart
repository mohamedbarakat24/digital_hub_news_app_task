import 'package:digital_hub_news_app_task/core/constants/colors.dart';
import 'package:digital_hub_news_app_task/feature/home/data/models/article_model.dart';
import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_bloc.dart';
import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_event.dart';
import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_state.dart';
import 'package:digital_hub_news_app_task/feature/details/presentation/screens/article_details_screen.dart';
import 'package:digital_hub_news_app_task/feature/home/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildNewsSection extends StatelessWidget {
  const BuildNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          // Loading state with shimmer effect
          if (state is NewsLoading) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CustomListTile(
                  article: ArticleModel(title: ''),
                  onTap: () {},
                  isLoading: true,
                );
              },
            );
          }

          // Error state
          if (state is NewsError) {
            return RefreshIndicator(
              color: MyColors.primaryColor,
              backgroundColor: MyColors.white,
              onRefresh: () async {
                context.read<NewsBloc>().add(
                  FetchNews(category: state.category),
                );
              },
              child: ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                  Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Error loading news',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          state.message,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () {
                            context.read<NewsBloc>().add(
                              FetchNews(category: state.category),
                            );
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          // Loaded state with articles
          if (state is NewsLoaded) {
            // Check if articles list is empty
            if (state.articles.isEmpty) {
              return RefreshIndicator(
                color: MyColors.primaryColor,
                backgroundColor: MyColors.white,
                onRefresh: () async {
                  context.read<NewsBloc>().add(
                    FetchNews(category: state.category),
                  );
                },
                child: ListView(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.article_outlined,
                            size: 64.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'No articles available',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Try refreshing or check back later',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            // Articles available - show list with pull to refresh
            return RefreshIndicator(
              color: MyColors.primaryColor,
              backgroundColor: MyColors.white,
              onRefresh: () async {
                context.read<NewsBloc>().add(
                  FetchNews(category: state.category),
                );
              },
              child: ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  final article = state.articles[index];
                  return CustomListTile(
                    article: article,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  ArticleDetailsScreen(article: article),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }

          // Initial state
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
