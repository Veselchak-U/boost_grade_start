import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class AppColorThemeGreen implements AppColorTheme {
  const AppColorThemeGreen();

  @override
  ThemeData get theme => ThemeData(
        primarySwatch: Colors.green,
      ).copyWith(
        // primaryColor: _primaryColor,
        backgroundColor: _white,
        scaffoldBackgroundColor: _white,
        appBarTheme: appBarTheme,
      );

  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        // color: _primaryColor,
        titleSpacing: 0,
        titleTextStyle: TextStyle(
          color: _onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w500,
          height: 28 / 22,
        ),
      );

  @override
  TextStyle get appBarShadowTextStyle =>
      theme.appBarTheme.titleTextStyle!.copyWith(
        shadows: [
          const Shadow(
            color: _textShadow,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      );

  // background
  static const _white = Color(0xFFFFFFFF);

  // static const _primaryColor = Color(0xFF43ABF5);

  // text
  static const _onSurface = Color(0xFF1C1B1F);

  // shadow
  static const _textShadow = Color.fromRGBO(0, 0, 0, 0.25);
}
