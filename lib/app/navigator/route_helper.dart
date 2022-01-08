import 'package:boost_grade_start/features/main/view/main_screen.dart';
import 'package:flutter/material.dart';

class RouteHelper {
  static MaterialPageRoute<PageRoute> getInitialRoute(RouteSettings settings) {
    return MaterialPageRoute<PageRoute>(
      settings: settings,
      builder: (context) => const MainScreen(),
    );
  }
}
