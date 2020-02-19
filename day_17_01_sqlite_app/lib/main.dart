import 'package:day_17_01_sqlite_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database/moor_database.dart';
//import 'package:day_17_01_sqlite_app/database/moor_database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase().taskTableDao,
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
