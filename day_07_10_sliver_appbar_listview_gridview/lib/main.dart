import 'package:flutter/material.dart';
import 'package:day_07_10_sliver_appbar_listview_gridview/home_screen.dart';
import 'package:day_07_10_sliver_appbar_listview_gridview/home_sliver_tableview.dart';
import 'home_sliver_gridview.dart';
import 'home_AppLifeCycle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
      //home: HomeSliverTableview(),
      home: HomeSliverGridView(),
      //home: HomePage(), //Represents AppLifeCycle
    );
  }
}

/*
-----------------------------------------
How to implement GridView
-----------------------------------------
var  arr_Images = [ image.network(), image.network(), image.network(), ]
var  delegateForGridView = SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount:3, crossAxisSpacing:8.0, mainAxisSpacing:8.0)

Inside build method of Scaffold

Container(
	child : GridView(
		padding: EdgeInset.only(top:8.0),
		gridDelegate : delegateForGridView,
		children : arr_Images,
	)
)
-----------------------------------------
*/
