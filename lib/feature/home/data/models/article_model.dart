import 'dart:convert';

class ArticleModel {
  final String title;
  final String? description;
  final String? imageUrl;
  final DateTime? publishedAt;
  final String? url;
  final String? category;
  final String? author;
  final String? sourceName;

  const ArticleModel({
    required this.title,
    this.description,
    this.imageUrl,
    this.publishedAt,
    this.url,
    this.category,
    this.author,
    this.sourceName,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    final String? publishedAtRaw = json['publishedAt'] as String?;
    DateTime? parsedDate;
    if (publishedAtRaw != null) {
      try {
        parsedDate = DateTime.parse(publishedAtRaw);
      } catch (_) {
        parsedDate = null;
      }
    }
    return ArticleModel(
      title: (json['title'] ?? '').toString(),
      description: (json['description'])?.toString(),
      category: json['category'] ?? 'general',
      imageUrl: (json['urlToImage'])?.toString(),
      publishedAt: parsedDate,
      url: (json['url'])?.toString(),
      author: (json['author'])?.toString(),
      sourceName: (json['source']['name'])?.toString(),
    );
  }

  static List<ArticleModel> listFromResponseBody(String body) {
    final Map<String, dynamic> decoded =
        jsonDecode(body) as Map<String, dynamic>;
    final List<dynamic> articlesJson =
        (decoded['articles'] as List<dynamic>? ?? <dynamic>[]);
    return articlesJson
        .whereType<Map<String, dynamic>>()
        .map<ArticleModel>(
          (Map<String, dynamic> item) => ArticleModel.fromJson(item),
        )
        .toList(growable: false);
  }

  ArticleModel copyWith({
    String? title,
    String? description,
    String? imageUrl,
    DateTime? publishedAt,
    String? url,
    String? category,
    String? author,
    String? sourceName,
  }) {
    return ArticleModel(
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      publishedAt: publishedAt ?? this.publishedAt,
      url: url ?? this.url,
      category: category ?? this.category,
      author: author ?? this.author,
      sourceName: sourceName ?? this.sourceName,
    );
  }
}
