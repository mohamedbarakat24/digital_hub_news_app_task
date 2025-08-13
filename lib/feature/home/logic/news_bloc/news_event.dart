abstract class NewsEvent {}

class FetchNews extends NewsEvent {
  final String category;

  FetchNews({required this.category});
}

class NewsCategorySelected extends NewsEvent {
  final String category;

  NewsCategorySelected({required this.category});
}

class SearchNews extends NewsEvent {
  final String query;
  SearchNews({required this.query});
}
