import 'dart:math';

import 'package:boost_grade_start/app/asset/asset.dart';
import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/app/view/components/bgs_scaffold.dart';
import 'package:boost_grade_start/features/squares/view/components/color_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SquaresScreen extends StatefulWidget {
  const SquaresScreen();

  @override
  State<SquaresScreen> createState() => _SquaresScreenState();
}

class _SquaresScreenState extends State<SquaresScreen> {
  static const _numberItems = 4;
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
    final squares = List.generate(
      _numberItems,
      (index) => ColorBox(color: _colors?[index]),
    );
    return BgsScaffold(
      appBar: AppBar(
        title: Text(context.l10n.squaresScreenTitle),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.symmetric(vertical: 82, horizontal: 31),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: squares,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColors,
        child: SvgPicture.asset(Asset.svg.iconEdit),
      ),
    );
  }
}
