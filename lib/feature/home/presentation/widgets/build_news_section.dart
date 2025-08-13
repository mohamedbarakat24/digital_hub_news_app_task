import 'package:digital_hub_news_app_task/feature/home/data/models/article_model.dart';
import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_bloc.dart';
import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_state.dart';
import 'package:digital_hub_news_app_task/feature/details/presentation/screens/article_details_screen.dart';
import 'package:digital_hub_news_app_task/feature/home/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildNewsSection extends StatelessWidget {
  const BuildNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
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

          if (state is NewsError) {
            return Center(child: Text(state.message));
          }

          if (state is NewsLoaded) {
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

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
