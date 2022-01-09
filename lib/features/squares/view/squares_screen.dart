import 'dart:math';

import 'package:boost_grade_start/app/asset/asset.dart';
import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/app/view/components/color_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SquaresScreen extends StatefulWidget {
  const SquaresScreen();

  @override
  State<SquaresScreen> createState() => _SquaresScreenState();
}

class _SquaresScreenState extends State<SquaresScreen> {
  static const _numberSquares = 4;
  final _random = Random();
  late List<Color?> _colors;

  Color get _randomColor => Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );

  @override
  void initState() {
    super.initState();
    _colors = List.generate(
      _numberSquares,
      (index) => null,
    );
  }

  void _changeColors() {
    setState(() {
      _colors = List.generate(
        _numberSquares,
        (index) => _randomColor,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final _squares = List.generate(
      _numberSquares,
      (index) => ColorBox(color: _colors[index]),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.squaresScreenTitle),
      ),
      body: Stack(
        children: [
          GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.symmetric(vertical: 82, horizontal: 31),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: _squares,
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