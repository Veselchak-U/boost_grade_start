import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/app/navigator/route_helper.dart';
import 'package:boost_grade_start/features/codelabs/view/codelabs_screen.dart';
import 'package:boost_grade_start/features/codelabs/view/codelabs_screen_route.dart';
import 'package:boost_grade_start/features/codelabs/view/page/favourites_page.dart';
import 'package:boost_grade_start/features/codelabs/view/page/favourites_page_route.dart';
import 'package:boost_grade_start/features/colour_list/view/colour_list_screen.dart';
import 'package:boost_grade_start/features/colour_list/view/colour_list_screen_route.dart';
import 'package:boost_grade_start/features/main/view/main_screen.dart';
import 'package:boost_grade_start/features/main/view/main_screen_route.dart';
import 'package:boost_grade_start/features/squares/view/squares_screen.dart';
import 'package:boost_grade_start/features/squares/view/squares_screen_route.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return RouteHelper.getInitialRoute(settings);

      case MainScreenRoute.name:
        return MaterialPageRoute<PageRoute>(
          settings: RouteSettings(
            name: settings.name,
            arguments: settings.arguments,
          ),
          builder: (_) => const MainScreen(),
        );

      case SquaresScreenRoute.name:
        return MaterialPageRoute<PageRoute>(
          settings: RouteSettings(
            name: settings.name,
            arguments: settings.arguments,
          ),
          builder: (_) => const SquaresScreen(),
        );

      case ColourListScreenRoute.name:
        return MaterialPageRoute<PageRoute>(
          settings: RouteSettings(
            name: settings.name,
            arguments: settings.arguments,
          ),
          builder: (_) => const ColourListScreen(),
        );

      case CodelabsScreenRoute.name:
        return MaterialPageRoute<PageRoute>(
          settings: RouteSettings(
            name: settings.name,
            arguments: settings.arguments,
          ),
          builder: (_) => const CodelabsScreen(),
        );

      case FavouritesPageRoute.name:
        final arguments = settings.arguments as FavouritesPageRouteArgs;
        return MaterialPageRoute<PageRoute>(
          settings: RouteSettings(
            name: settings.name,
          ),
          builder: (_) => FavouritesPage(arguments),
        );

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
