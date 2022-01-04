import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/app/navigator/route_generator.dart';
import 'package:boost_grade_start/app/settings/app_settings.dart';
import 'package:boost_grade_start/app/view/screen/error_screen.dart';
import 'package:boost_grade_start/app/view/screen/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late final Future<void> _initResult;
  late final AppSettings _appSettings;

  @override
  void initState() {
    super.initState();
    _initResult = _init();
  }

  Future<void> _init() async {
    _appSettings = AppSettings();
    // some initialization operations
    await Future<void>.delayed(const Duration(seconds: 2));
    // throw 'Initializing error';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initResult,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        }
        if (snapshot.hasError) {
          return ErrorScreen('${snapshot.error}');
        }
        return ChangeNotifierProvider<AppSettings>.value(
          value: _appSettings,
          child: Consumer<AppSettings>(
            builder: (context, appSettings, _) {
              return MaterialApp(
                onGenerateTitle: (context) => context.l10n.appTitle,
                theme: appSettings.colorTheme.theme,
                locale: appSettings.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                // disable the reaction to changing the size of the system font
                builder: (context, widget) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: widget ?? const SizedBox.shrink(),
                ),
                onGenerateRoute: RouteGenerator.onGenerateRoute,
              );
            },
          ),
        );
      },
    );
  }
}
