import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class CodelabsListItem extends StatefulWidget {
  const CodelabsListItem({
    Key? key,
    required this.item,
    required this.favourites,
  }) : super(key: key);

  final WordPair item;
  final Set<WordPair> favourites;

  @override
  _CodelabsListItemState createState() => _CodelabsListItemState();
}

class _CodelabsListItemState extends State<CodelabsListItem> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.favourites.contains(widget.item);
  }

  void _switchLike() {
    _updateFavourites();
    setState(() {
      _selected = !_selected;
    });
  }

  void _updateFavourites() {
    if (_selected) {
      widget.favourites.remove(widget.item);
    } else {
      widget.favourites.add(widget.item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.item.asPascalCase),
      trailing: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          _selected ? Icons.favorite : Icons.favorite_border,
          key: ValueKey(_selected),
          color: _selected ? Colors.red : null,
        ),
      ),
      onTap: _switchLike,
    );
  }
}
