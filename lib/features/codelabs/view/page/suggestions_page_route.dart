import 'package:english_words/english_words.dart';

class SuggestionsPageRoute {
  static const name = 'SuggestionsPageRoute';
}

class SuggestionsPageRouteArgs {
  final Set<WordPair> items;

  SuggestionsPageRouteArgs(this.items);
}
