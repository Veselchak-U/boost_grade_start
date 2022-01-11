import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/features/codelabs/view/page/suggestions_page_route.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class CodelabsScreen extends StatefulWidget {
  const CodelabsScreen();

  @override
  State<CodelabsScreen> createState() => _CodelabsScreenState();
}

class _CodelabsScreenState extends State<CodelabsScreen> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _addSuggestions();
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  void _addSuggestions() {
    _suggestions.addAll(generateWordPairs().take(10));
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase),
      trailing: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          key: ValueKey(alreadySaved),
          color: alreadySaved ? Colors.red : null,
        ),
      ),
      onTap: () => _switchLike(pair, alreadySaved),
    );
  }

  void _switchLike(WordPair pair, bool alreadySaved) {
    setState(() {
      _updateLike(pair, alreadySaved);
    });
  }

  void _updateLike(WordPair pair, bool alreadySaved) {
    if (alreadySaved) {
      _saved.remove(pair);
    } else {
      _saved.add(pair);
    }
  }

  void _openSavedSuggestionsPage() {
    Navigator.pushNamed(
      context,
      SuggestionsPageRoute.name,
      arguments: SuggestionsPageRouteArgs(_saved),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.codelabScreenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _openSavedSuggestionsPage,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
