import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/app/navigator/route_helper.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return RouteHelper.getInitialRoute(settings);

      default:
        return MaterialPageRoute<PageRoute>(
          builder: (context) => SafeArea(
            child: Scaffold(
              body: Text(context.l10n.navigatorErrorNoRoute(settings.name)),
            ),
          ),
        );
    }
  }
}
