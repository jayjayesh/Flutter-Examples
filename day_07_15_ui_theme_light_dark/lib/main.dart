import 'package:day_07_15_ui_theme_light_dark/custome_theme_data.dart';
import 'package:day_07_15_ui_theme_light_dark/dark_theme_provider.dart';
import 'package:day_07_15_ui_theme_light_dark/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    //when app just launch : get theme pref from sharedPrefrence
    getThemefromSharedPrefrence();
  }

  getThemefromSharedPrefrence() async {
    themeProvider.darkTheme = await themeProvider.appPref.getBoolIsDarkTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            theme: CustomeThemeData.themeData(
              isDarkTheme: themeProvider.darkTheme,
              context: context,
            ),
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
