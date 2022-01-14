import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/features/codelabs/view/page/favourites_page_route.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class CodelabsScreen extends StatefulWidget {
  const CodelabsScreen();

  @override
  State<CodelabsScreen> createState() => _CodelabsScreenState();
}

class _CodelabsScreenState extends State<CodelabsScreen> {
  final _items = <WordPair>[];
  final _favourites = <WordPair>{};

  @override
  void initState() {
    super.initState();
    _addItems();
  }

  void _addItems() {
    _items.addAll(generateWordPairs().take(10));
  }

  Widget _buildItemList() {
    return ListView.separated(
      itemCount: _items.length,
      itemBuilder: (_, index) {
        if (index == _items.length - 1) {
          _getNextPage();
        }
        return _buildItem(_items[index]);
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }

  Future<void> _getNextPage() async {
    await Future.delayed(Duration.zero);
    setState(() {
      _addItems();
    });
  }

  Widget _buildItem(WordPair item) {
    final isFavorite = _favourites.contains(item);
    return ListTile(
      title: Text(item.asPascalCase),
      trailing: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          key: ValueKey(isFavorite),
          color: isFavorite ? Colors.red : null,
        ),
      ),
      onTap: () => _switchLike(item),
    );
  }

  void _switchLike(WordPair item) {
    setState(() {
      _updateFavourites(item);
    });
  }

  void _updateFavourites(WordPair item) {
    final isFavorite = _favourites.contains(item);
    if (isFavorite) {
      _favourites.remove(item);
    } else {
      _favourites.add(item);
    }
  }

  void _goToFavouritesPage() {
    Navigator.pushNamed(
      context,
      FavouritesPageRoute.name,
      arguments: FavouritesPageRouteArgs(_favourites),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.codelabScreenTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _goToFavouritesPage,
          ),
        ],
      ),
      body: _buildItemList(),
    );
  }
}
