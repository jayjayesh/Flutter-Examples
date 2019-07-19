import 'package:day_03_01_left_menu_properway_pageview/leftMenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LeftMenuScreenClass(),
    );
  }
}
