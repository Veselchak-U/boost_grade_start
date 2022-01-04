import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:boost_grade_start/app/theme/app_color_theme_light.dart';
import 'package:boost_grade_start/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier {
  static const _defaultColorTheme = AppColorThemeLight();
  static const _defaultTextTheme = AppTextTheme();
  static const _defaultLocale = Locale('ru');

  AppColorTheme _colorTheme = _defaultColorTheme;

  AppColorTheme get colorTheme => _colorTheme;

  set colorTheme(AppColorTheme value) {
    _colorTheme = value;
    notifyListeners();
  }

  AppTextTheme _textTheme = _defaultTextTheme;

  AppTextTheme get textTheme => _textTheme;

  set textTheme(AppTextTheme value) {
    _textTheme = value;
    notifyListeners();
  }

  Locale _locale = _defaultLocale;

  Locale get locale => _locale;

  set locale(Locale value) {
    _locale = value;
    notifyListeners();
  }
}
