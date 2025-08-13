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

          if (state is NewsError) {
            return Center(child: Text(state.message));
          }

          if (state is NewsLoaded && state.articles.isNotEmpty) {
            return ListView.builder(
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
                            (context) => ArticleDetailsScreen(article: article),
                      ),
                    );
                  },
                );
              },
            );
          }

          return Center(
            child: Text(
              'No results found',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
                fontFamily: 'Poppins',
              ),
            ),
          );
        },
      ),
    );
  }
}
