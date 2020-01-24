import 'package:day_07_15_ui_theme_light_dark/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final kSelectedDarkThemeString = 'Dark Theme';
final kSelectedLightThemeString = 'Light Theme';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    String selectedThemeString = themeProvider.darkTheme == true
        ? kSelectedDarkThemeString
        : kSelectedLightThemeString;

    return Scaffold(
      appBar: AppBar(
        title: Text('Swicht Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have selected : $selectedThemeString',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeProvider.darkTheme = !themeProvider.darkTheme;
        },
        tooltip: 'Switch Theme',
        child: Icon(Icons.lightbulb_outline),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
