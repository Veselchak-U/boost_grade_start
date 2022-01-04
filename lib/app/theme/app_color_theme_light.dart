import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class AppColorThemeLight implements AppColorTheme {
  const AppColorThemeLight();

  @override
  ThemeData get theme => ThemeData(
        primarySwatch: Colors.blue,
      );
}
