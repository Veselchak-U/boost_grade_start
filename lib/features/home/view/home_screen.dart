import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/app/settings/app_settings.dart';
import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:boost_grade_start/app/theme/app_color_theme_green.dart';
import 'package:boost_grade_start/app/theme/app_color_theme_light.dart';
import 'package:boost_grade_start/app/theme/app_color_theme_orange.dart';
import 'package:boost_grade_start/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _changeColorTheme() {
    final appSettings = Provider.of<AppSettings>(context, listen: false);
    final newColorTheme = _getNewColorTheme(appSettings.colorTheme);
    appSettings.colorTheme = newColorTheme;
  }

  AppColorTheme _getNewColorTheme(AppColorTheme currentTheme) {
    AppColorTheme newTheme;
    if (currentTheme is AppColorThemeLight) {
      newTheme = const AppColorThemeGreen();
    } else if (currentTheme is AppColorThemeGreen) {
      newTheme = const AppColorThemeOrange();
    } else {
      newTheme = const AppColorThemeLight();
    }
    return newTheme;
  }

  void _changeLocale() {
    final appSettings = Provider.of<AppSettings>(context, listen: false);
    final newLocale = _getNewLocale(appSettings.locale);
    appSettings.locale = newLocale;
  }

  Locale _getNewLocale(Locale currentLocale) {
    Locale newLocale;
    if (currentLocale.languageCode == 'ru') {
      newLocale = const Locale('en');
    } else {
      newLocale = const Locale('ru');
    }
    return newLocale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(context.l10n.homeScreenLabel),
            Text(
              '$_counter',
              style: context.textTheme.s32w7.copyWith(
                color: context.colorTheme.theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _changeColorTheme,
            tooltip: context.l10n.fabColorTooltip,
            child: const Icon(Icons.color_lens_outlined),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: _changeLocale,
            tooltip: context.l10n.fabLanguageTooltip,
            child: const Icon(Icons.language),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: context.l10n.fabIncrementTooltip,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: context.l10n.fabDecrementTooltip,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
