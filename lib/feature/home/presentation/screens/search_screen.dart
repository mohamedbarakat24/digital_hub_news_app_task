import 'package:digital_hub_news_app_task/feature/home/data/models/article_model.dart';
import 'package:digital_hub_news_app_task/feature/details/presentation/screens/article_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_list_tile.dart';
import '../../logic/news_bloc/news_bloc.dart';
import '../../logic/news_bloc/news_event.dart';
import '../../logic/news_bloc/news_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search news...',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 16.sp,
              fontFamily: 'Poppins',
            ),
          ),
          onChanged: (query) {
            if (query.length >= 3) {
              context.read<NewsBloc>().add(SearchNews(query: query));
            }
          },
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          // Loading state
          if (state is NewsLoading) {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return CustomListTile(
                  article: ArticleModel(
                    title: '',
                    description: '',
                    url: '',
                    imageUrl: '',
                    publishedAt: DateTime.now(),
                    sourceName: '',
                    category: '',
                  ),
                  onTap: () {},
                  isLoading: true,
                );
              },
            );
          }

          // Error state
          if (state is NewsError) {
            return RefreshIndicator(
              onRefresh: () async {
                if (_searchController.text.length >= 3) {
                  context.read<NewsBloc>().add(
                    SearchNews(query: _searchController.text),
                  );
                }
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
                          'Error searching news',
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
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          // Loaded state with search results
          if (state is NewsLoaded) {
            // No search results found
            if (state.articles.isEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  if (_searchController.text.length >= 3) {
                    context.read<NewsBloc>().add(
                      SearchNews(query: _searchController.text),
                    );
                  }
                },
                child: ListView(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'No results found',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Try different keywords or check spelling',
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

            // Search results available
            return RefreshIndicator(
              onRefresh: () async {
                if (_searchController.text.length >= 3) {
                  context.read<NewsBloc>().add(
                    SearchNews(query: _searchController.text),
                  );
                }
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

          // Initial state - show search prompt
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, size: 64.sp, color: Colors.grey[400]),
                SizedBox(height: 16.h),
                Text(
                  'Search for news articles',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Type at least 3 characters to search',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
