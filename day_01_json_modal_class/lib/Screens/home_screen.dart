import 'package:flutter/material.dart';
import 'package:day_01_json_modal_class/Constant/app_constant.dart';
import 'package:day_01_json_modal_class/Model/artile_model.dart';
import 'dart:async';
import 'dart:convert';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        color: Colors.orangeAccent,
        child: ArticleTableView(),
      ),
    );
  }
}

class ArticleTableView extends StatefulWidget {
  @override
  _ArticleTableViewState createState() => _ArticleTableViewState();
}

class _ArticleTableViewState extends State<ArticleTableView> {
  var arrAllArticles;
//List<article> arrAllArticles;

  Future<List<article>> getArticleData(String newType) async {
    var res = await http.get(Uri.encodeFull(webServices.getArticles),
        headers: {"Accept": "application/json"});
    print(res.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
