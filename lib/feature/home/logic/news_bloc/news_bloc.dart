import 'package:bloc/bloc.dart';
import 'package:digital_hub_news_app_task/feature/home/data/news_repository.dart';
import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_event.dart';
import 'package:digital_hub_news_app_task/feature/home/logic/news_bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;
  String _currentCategory = 'all';
  NewsBloc({required this.repository}) : super(const NewsInitial()) {
    on<FetchNews>((event, emit) async {
      try {
        final category = event.category.toLowerCase();
        _currentCategory = category;
        emit(NewsLoading(category));
        final articles = await repository.getTopHeadlinesByCategory(category);

        final updatedArticles =
            articles.map((article) {
              return article.copyWith(
                category: category == 'all' ? article.category : category,
              );
            }).toList();

        emit(NewsLoaded(articles: updatedArticles, category: category));
      } catch (e) {
        emit(NewsError(message: e.toString(), category: event.category));
      }
    });

    on<NewsCategorySelected>((event, emit) {
      add(FetchNews(category: event.category));
    });

    on<SearchNews>((event, emit) async {
      try {
        emit(NewsLoading(_currentCategory));
        final articles = await repository.searchNews(event.query);
        emit(NewsLoaded(articles: articles, category: _currentCategory));
      } catch (e) {
        emit(NewsError(message: e.toString(), category: _currentCategory));
      }
    });
  }
}
