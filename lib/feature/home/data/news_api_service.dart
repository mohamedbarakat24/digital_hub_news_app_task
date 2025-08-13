import 'package:dio/dio.dart';

class NewsApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/top-headlines';
  static const String _apiKey = '1690f32140664811b53d4c89e7e7bb23';
  static const String _country = 'us';

  final Dio _dio;

  NewsApiService({Dio? dio}) : _dio = dio ?? Dio();

  Future<Response> fetchTopHeadlinesByCategory(String category) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'country': _country,
          'category': category == 'all' ? 'general' : category,
          'apiKey': _apiKey,
        },
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }

  Future<Response> searchNews(String query) async {
    try {
      final response = await _dio.get(
        'https://newsapi.org/v2/everything',
        queryParameters: {'q': query, 'apiKey': _apiKey, 'language': 'en'},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to search news: $e');
    }
  }
}
