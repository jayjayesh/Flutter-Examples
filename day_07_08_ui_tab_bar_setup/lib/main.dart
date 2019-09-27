import 'package:day_07_08_ui_tab_bar_setup/homeScreen.dart';
import 'package:day_07_08_ui_tab_bar_setup/homeScreen_TopTabBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primarySwatch: Colors.red,
        primaryColor: const Color(0xFFF44336), // Colors.red,
        accentColor: const Color(0xFFFFFB3B), // Colors.yellow,
        primaryColorBrightness: Brightness.dark,
      ),
      //home: HomeScreen(),
      home: HomeScreenTopTabBar(),
    );
  }
}
