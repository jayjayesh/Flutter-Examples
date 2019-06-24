import 'package:flutter/material.dart';
import 'screen1.dart';
import 'screen2.dart';
//import 'dart:async';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(),
    home: Screen1(),
    //initialRoute: Screen1.routeName,
    routes: {
      Screen1.routeName: (context) => Screen1(),
      Screen2.routeName: (context) => Screen2(),
    },
  ));
}
