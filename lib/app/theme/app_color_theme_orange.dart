import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class AppColorThemeOrange implements AppColorTheme {
  const AppColorThemeOrange();

  @override
  ThemeData get theme => ThemeData(
        primarySwatch: Colors.orange,
      );
}
