import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class AppColorThemeOrange implements AppColorTheme {
  const AppColorThemeOrange();

  @override
  ThemeData get theme => ThemeData(
        primarySwatch: Colors.orange,
      );

  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      );

  @override
  TextStyle get appBarShadowTextStyle =>
      theme.appBarTheme.titleTextStyle!.copyWith(
        shadows: [
          const Shadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      );
}
