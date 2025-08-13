import 'package:digital_hub_news_app_task/feature/home/data/models/article_model.dart';
import 'package:digital_hub_news_app_task/feature/home/data/news_api_service.dart';

class NewsRepository {
  final NewsApiService _apiService;

  NewsRepository({required NewsApiService apiService})
    : _apiService = apiService;

  Future<List<ArticleModel>> getTopHeadlinesByCategory(String category) async {
    try {
      final response = await _apiService.fetchTopHeadlinesByCategory(category);

      if (response.statusCode == 200) {
        final List<dynamic> articles = response.data['articles'];
        return articles
            .map((article) => ArticleModel.fromJson(article))
            .toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Repository Error: $e');
    }
  }

  Future<List<ArticleModel>> searchNews(String query) async {
    try {
      final response = await _apiService.searchNews(query);

      if (response.statusCode == 200) {
        final List<dynamic> articles = response.data['articles'];
        return articles
            .map((article) => ArticleModel.fromJson(article))
            .toList();
      } else {
        throw Exception('Failed to search news');
      }
    } catch (e) {
      throw Exception('Repository Error: $e');
    }
  }
}

class NewsRepositoryException implements Exception {
  final String message;
  NewsRepositoryException(this.message);

  @override
  String toString() => message;
}
