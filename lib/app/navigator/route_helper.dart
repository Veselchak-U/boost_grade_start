import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class RouteHelper {
  static MaterialPageRoute<PageRoute> getInitialRoute(RouteSettings settings) {
    return MaterialPageRoute<PageRoute>(
      settings: settings,
      builder: (context) => HomeScreen(title: context.l10n.homeScreenTitle),
    );
  }
}
