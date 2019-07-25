import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:day_07_04_ui_textfield_predict_gender/homeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreenClass());
  }
}
