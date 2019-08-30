import 'package:day_01_03_parse_json_raywenderlich_github_members/screens/homeScreen.dart';
import 'package:day_01_03_parse_json_raywenderlich_github_members/screens/httpGetAllMembers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromRGBO(0, 138, 62, 1.0)),
      home: HomeScreen(),
      //home: AllGithubMembers(),
      routes: <String, WidgetBuilder>{
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
        AllGithubMembers.routeName: (BuildContext context) =>
            AllGithubMembers(),
      },
    );
  }
}
