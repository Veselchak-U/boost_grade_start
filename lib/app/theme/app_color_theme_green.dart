import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class AppColorThemeGreen implements AppColorTheme {
  const AppColorThemeGreen();

  @override
  ThemeData get theme => ThemeData(
        primarySwatch: Colors.green,
      );
}
