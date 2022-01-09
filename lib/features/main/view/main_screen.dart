import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:boost_grade_start/features/main/view/components/navigation_button.dart';
import 'package:boost_grade_start/features/squares/view/squares_screen_route.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 56),
          child: Text(
            context.l10n.mainScreenTitle,
            style: context.colorTheme.appBarShadowTextStyle,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Column(
            children: [
              NavigationButton(
                label: context.l10n.squaresScreenTitle,
                routeName: SquaresScreenRoute.name,
              ),
              NavigationButton(
                label: context.l10n.colorListScreenTitle,
              ),
              NavigationButton(
                label: context.l10n.codelabScreenTitle,
              ),
              NavigationButton(
                label: context.l10n.asyncRequestScreenTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
