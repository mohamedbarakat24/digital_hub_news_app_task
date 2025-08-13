abstract class NewsEvent {}

class FetchNews extends NewsEvent {
  final String category;
  FetchNews({this.category = 'general'});
}

class NewsCategorySelected extends NewsEvent {
  final String category;
  NewsCategorySelected(this.category);
}

class SearchNews extends NewsEvent {
  final String query;
  SearchNews({required this.query});
}
