import 'package:english_words/english_words.dart';

class FavouritesPageRoute {
  static const name = 'FavouritesPageRoute';
}

class FavouritesPageRouteArgs {
  final Set<WordPair> items;

  FavouritesPageRouteArgs(this.items);
}
