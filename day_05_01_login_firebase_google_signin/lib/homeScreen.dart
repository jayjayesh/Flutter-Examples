import 'package:flutter/material.dart';

class HomeScreenClass extends StatelessWidget {
  static const String routeName = "/homeScreen";
  final passData;
  HomeScreenClass({this.passData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
