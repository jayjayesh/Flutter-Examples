import 'package:day_16_01_mobx_default_app/screens/home_page.dart';
import 'package:day_16_01_mobx_default_app/screens/movie_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviePage(),
      //home: HomePage(),
    );
  }
}
