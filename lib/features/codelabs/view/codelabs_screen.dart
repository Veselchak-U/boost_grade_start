import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/features/codelabs/view/components/codelabs_list_item.dart';
import 'package:boost_grade_start/features/codelabs/view/page/favourites_page_route.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class CodelabsScreen extends StatefulWidget {
  const CodelabsScreen();

  @override
  State<CodelabsScreen> createState() => _CodelabsScreenState();
}

class _CodelabsScreenState extends State<CodelabsScreen> {
  late final List<WordPair> _items;
  late final Set<WordPair> _favourites;
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _items = [];
    _favourites = {};
    _addItems();
    _controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addItems() {
    _items.addAll(generateWordPairs().take(20));
  }

  void _scrollListener() {
    if (_controller.position.extentAfter < 100) {
      _getNextPage();
    }
  }

  Future<void> _getNextPage() async {
    setState(() {
      _addItems();
    });
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
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        controller: _controller,
        itemCount: _items.length,
        itemBuilder: (_, index) => CodelabsListItem(
          key: ValueKey(index),
          item: _items[index],
          favourites: _favourites,
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
