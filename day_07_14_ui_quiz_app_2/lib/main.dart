import 'package:day_07_14_ui_quiz_app_2/home_screen.dart';
import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

void main() {
  runApp(MaterialApp(
    theme: choise1LightTheme(),
    home: Homescreen(),
  ));
}

ThemeData choise1LightTheme() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.orange,
    scaffoldBackgroundColor: Colors.orange,
    canvasColor: Colors.orange,
  );
}
