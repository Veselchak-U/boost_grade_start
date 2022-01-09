import 'dart:math';

import 'package:boost_grade_start/app/asset/asset.dart';
import 'package:boost_grade_start/app/l10n/l10n.dart';
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

  void _changeColors() {
    setState(() {
      _colors = List.generate(
        _numberItems,
        (index) => _randomColor,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.colorListScreenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            itemCount: _numberItems,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ColorBox(
                key: ValueKey(index),
                color: _colors?[index],
                height: 71,
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 45,
            child: FloatingActionButton(
              onPressed: _changeColors,
              child: SvgPicture.asset(Asset.svg.iconEdit),
            ),
          )
        ],
      ),
    );
  }
}
