import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class AppColorThemeOrange implements AppColorTheme {
  const AppColorThemeOrange();

  @override
  ThemeData get theme => ThemeData(
        primarySwatch: Colors.orange,
      ).copyWith(
        primaryColor: _primaryColor,
        backgroundColor: _white,
        scaffoldBackgroundColor: _white,
        disabledColor: _disabledColor,
        appBarTheme: appBarTheme,
        floatingActionButtonTheme: floatingActionButtonTheme,
      );

  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        color: _primaryColor,
        foregroundColor: _onSurface,
        centerTitle: false,
        titleSpacing: 0,
        titleTextStyle: TextStyle(
          color: _onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w500,
          height: 28 / 22,
        ),
      );

  @override
  TextStyle get appBarShadowTextStyle => appBarTheme.titleTextStyle!.copyWith(
        shadows: [
          const Shadow(
            color: _textShadow,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      );

  @override
  ButtonStyle get navigationButtonStyle => TextButton.styleFrom(
        fixedSize: const Size(double.infinity, 48),
        elevation: 0,
        backgroundColor: _primaryColor,
        primary: _onSurface,
        padding: const EdgeInsets.symmetric(horizontal: 21),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonTheme =>
      FloatingActionButtonThemeData(
        backgroundColor: _primaryColor,
        foregroundColor: _onPrimaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      );

  // background
  static const _white = Color(0xFFFFFFFF);
  static const _primaryColor = Colors.orangeAccent;
  static const _disabledColor = Color(0xFFC4C4C4);

  // foreground
  static const _onPrimaryContainer = Color(0xFF21005D);

  // text
  static const _onSurface = Color(0xFF1C1B1F);

  // shadow
  static const _textShadow = Color.fromRGBO(0, 0, 0, 0.25);
}
