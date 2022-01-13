import 'package:boost_grade_start/app/settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension AppColorThemeX on BuildContext {
  AppColorTheme get colorTheme => Provider.of<AppSettings>(this).colorTheme;
}

abstract class AppColorTheme {
  ThemeData get theme;

  AppBarTheme get appBarTheme;

  TextStyle get appBarShadowTextStyle;

  ButtonStyle get navigationButtonStyle;

  FloatingActionButtonThemeData get floatingActionButtonTheme;
}
