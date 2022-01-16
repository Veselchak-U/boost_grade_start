import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/features/codelabs/view/page/favourites_page_route.dart';
import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage(this.arguments);

  final FavouritesPageRouteArgs? arguments;

  @override
  Widget build(BuildContext context) {
    final items = arguments?.items ?? {};
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.favouritesPageTitle),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (_, int index) {
          final title = items.elementAt(index).asPascalCase;
          return ListTile(
            title: Text(title),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
