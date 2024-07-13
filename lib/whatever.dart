import 'package:flutter/material.dart';
import 'package:my_cv/pages/authentification.page.dart';
import 'package:my_cv/pages/competence.page.dart';
import 'package:my_cv/pages/education.page.dart';
import 'package:my_cv/pages/experience.page.dart';
import 'package:my_cv/pages/home.page.dart';
import 'package:my_cv/pages/infopersonnel.page.dart';
import 'package:my_cv/pages/inscription.page.dart';
import 'package:my_cv/pages/location.dart';
import 'package:my_cv/pages/objectif.page.dart';
import 'package:my_cv/pages/profil.page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => HomePage(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => LoginScreen(),
    '/profil': (context) => ProfilPage(),
    '/education': (context) => EducationPage(),
    '/competence': (context) => CompetencePage(),
    '/experience': (context) => ExperiencePage(),
    '/position': (context) => LocationPage(),
    '/objectif': (context) => ObjectifPage(),
    '/info': (context) => InfoPage(),
  };

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
        var x = prefs.data;
        if (prefs.hasData) {
          bool conn = x?.getBool('connecte') ?? false;
          if (conn) {
            return ChangeNotifierProvider(
              create: (_) => ThemeNotifier(),
              child: MyAppWithTheme(routes: routes),
            );
          }
        }
        return ChangeNotifierProvider(
          create: (_) => ThemeNotifier(),
          child: MyAppWithTheme(routes: routes),
        );
      },
    );
  }
}

class MyAppWithTheme extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;

  MyAppWithTheme({required this.routes});

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      darkTheme: ThemeData.dark(),
      themeMode: themeNotifier.getThemeMode(),
      home: HomePage(),
      routes: routes,
    );
  }
}

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  ThemeMode _themeMode = ThemeMode.light;

  ThemeData getTheme() => _themeData;

  ThemeMode getThemeMode() => _themeMode;

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
      _themeData = ThemeData.dark();
    } else {
      _themeMode = ThemeMode.light;
      _themeData = ThemeData.light();
    }
    notifyListeners();
  }
}
