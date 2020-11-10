import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/routes/routes.dart';
import 'package:flutter_app/util/log_utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final AbstractRoutes routes = Routes.routes;
  final ThemeData _lightTheme = ThemeData.light();
  final ThemeData _darkTheme = ThemeData.dark();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: _lightTheme,
        darkTheme: _darkTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN')
      ],
      home: routes.buildPage('mainpage', null),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute<Object>(builder: (BuildContext context) {
            return routes.buildPage(settings.name, settings.arguments);
          });
        }
    );
  }

  Future _init() async {
    await Log.init();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }



}



