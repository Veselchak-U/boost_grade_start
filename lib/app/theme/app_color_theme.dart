import 'package:boost_grade_start/app/settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AppColorTheme {
  static AppColorTheme of(BuildContext context) =>
      Provider.of<AppSettings>(context).colorTheme;

  ThemeData get theme;
}
