import 'package:boost_grade_start/app/asset/asset.dart';
import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/app/view/components/bgs/bgs_progress_indicator.dart';
import 'package:boost_grade_start/app/view/components/bgs/bgs_scaffold.dart';
import 'package:boost_grade_start/features/async_call/model/photo_model.dart';
import 'package:boost_grade_start/features/async_call/provider/data_provider.dart';
import 'package:boost_grade_start/features/async_call/provider/data_provider_impl.dart';
import 'package:boost_grade_start/features/async_call/view/async_call_screen_route.dart';
import 'package:boost_grade_start/features/async_call/view/components/photo_card.dart';
import 'package:boost_grade_start/util/debug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AsyncCallScreen extends StatefulWidget {
  const AsyncCallScreen(this.arguments);

  final AsyncCallScreenRouteArgs? arguments;

  @override
  State<AsyncCallScreen> createState() => _AsyncCallScreenState();
}

class _AsyncCallScreenState extends State<AsyncCallScreen> {
  late List<PhotoModel> _items;
  late bool _progress;
  late DataProvider _dataProvider;

  @override
  void initState() {
    super.initState();
    _items = [];
    _progress = false;
    _dataProvider = widget.arguments?.dataProvider ?? DataProviderImpl();
  }

  void _updateProgress(bool value) {
    setState(() {
      _progress = value;
    });
  }

  Future<void> _requestPhotos() async {
    _updateProgress(true);
    try {
      final result = await _dataProvider.getPhotos();
      _items = result ?? [];
    } catch (error) {
      out(error);
    } finally {
      _updateProgress(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BgsScaffold(
      appBar: AppBar(
        title: Text(context.l10n.asyncCallScreenTitle),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            itemCount: _items.length,
            itemBuilder: (_, int index) {
              final item = _items[index];
              return PhotoCard(
                key: ValueKey(index),
                url: item.url,
                title: item.title,
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 10),
          ),
          _progress ? const BgsProgressIndicator() : const SizedBox.shrink(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _requestPhotos,
        child: SvgPicture.asset(Asset.svg.iconEdit),
      ),
    );
  }
}
