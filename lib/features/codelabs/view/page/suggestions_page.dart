import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/features/codelabs/view/page/suggestions_page_route.dart';
import 'package:flutter/material.dart';

class SuggestionsPage extends StatelessWidget {
  const SuggestionsPage(this.arguments);

  final SuggestionsPageRouteArgs arguments;

  @override
  Widget build(BuildContext context) {
    final items = arguments.items;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.suggestionsPageTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
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
