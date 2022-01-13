import 'dart:math';

import 'package:boost_grade_start/app/asset/asset.dart';
import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/app/view/components/bgs_scaffold.dart';
import 'package:boost_grade_start/app/view/components/color_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ColourListScreen extends StatefulWidget {
  const ColourListScreen();

  @override
  State<ColourListScreen> createState() => _ColourListScreenState();
}

class _ColourListScreenState extends State<ColourListScreen> {
  static const _numberItems = 1000;
  final _random = Random();
  List<Color>? _colors;

  Color get _randomColor => Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );

  void _mixColors() {
    _colors = List.generate(
      _numberItems,
      (_) => _randomColor,
    );
  }

  void _changeColors() {
    setState(() {
      _mixColors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BgsScaffold(
      appBar: AppBar(
        title: Text(context.l10n.colorListScreenTitle),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        itemCount: _numberItems,
        itemBuilder: (BuildContext context, int index) => ColorBox(
          key: ValueKey(index),
          color: _colors?[index],
          height: 71,
        ),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 10),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColors,
        child: SvgPicture.asset(Asset.svg.iconEdit),
      ),
    );
  }
}
