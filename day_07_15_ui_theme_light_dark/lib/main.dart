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
        builder: (BuildContext context, themeProvider, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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

/*

/// Simple way to swich between light-Dark Themes
/// define both (theme) & (darkTheme)
/// whene-ever user changes displayTheme from settingApp
/// thene your app will change it automatically
/// If you want to give this controll in your app (use above code)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MyHomePageTemp(),
    );
  }
}

class MyHomePageTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme demo'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('Hello World'),
      ),
    );
  }
}


*/
