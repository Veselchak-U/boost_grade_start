import 'package:boost_grade_start/app/settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTextTheme {
  static AppTextTheme of(BuildContext context) =>
      Provider.of<AppSettings>(context).textTheme;

  const AppTextTheme();

  final TextStyle s32w7 = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
  final TextStyle s24w7h32 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
  );
  final TextStyle s22w5h28 = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 28 / 22,
  );
  final TextStyle s16w4 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
