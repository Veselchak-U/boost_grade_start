import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  const ColorBox({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color ?? context.colorTheme.theme.disabledColor);
  }
}
