import 'package:digital_hub_news_app_task/feature/home/data/models/article_model.dart';

abstract class NewsState {
  final String category;
  const NewsState(this.category);
}

class NewsInitial extends NewsState {
  const NewsInitial() : super('all');
}

class NewsLoading extends NewsState {
  const NewsLoading(super.category);
}

class NewsLoaded extends NewsState {
  final List<ArticleModel> articles;

  const NewsLoaded({required this.articles, required String category})
    : super(category);
}

class NewsError extends NewsState {
  final String message;
  const NewsError({required this.message, required String category})
    : super(category);
}
