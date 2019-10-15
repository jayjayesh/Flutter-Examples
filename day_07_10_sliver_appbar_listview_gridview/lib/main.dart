import 'package:flutter/material.dart';
import 'package:day_07_10_sliver_appbar_listview_gridview/home_screen.dart';
import 'package:day_07_10_sliver_appbar_listview_gridview/home_sliver_tableview.dart';
import 'home_sliver_gridview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomeScreen(),
      //home: HomeSliverTableview(),
      home: HomeSliverGridView(),
    );
  }
}
