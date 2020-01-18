import 'package:day_14_01_mvvm_articles/pages/homePage.dart';
import 'package:day_14_01_mvvm_articles/viewmodels/articleListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: ChangeNotifierProvider(
        create: (context) => ArticleListViewModel(),
        child: HomePage(),
      ),
    );
  }
}
