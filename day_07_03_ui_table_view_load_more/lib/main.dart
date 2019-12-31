import 'package:day_07_03_ui_table_view_load_more/homeScreen.dart';
import 'package:day_07_03_ui_table_view_load_more/tableView_Dismiss_Alert.dart';
import 'package:day_07_03_ui_table_view_load_more/tableView_Dismiss_snackBar.dart';
import 'package:day_07_03_ui_table_view_load_more/tableView_Load_More.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        TableViewLoadMoreScreen.routeName: (context) =>
            TableViewLoadMoreScreen(),
        TableViewDismissWithAlert.routeName: (context) =>
            TableViewDismissWithAlert(),
        TableViewDismissWithSnackBar.routeName: (context) =>
            TableViewDismissWithSnackBar(),
      },
    );
  }
}
