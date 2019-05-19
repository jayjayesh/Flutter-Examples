import 'package:flutter/material.dart';
import 'package:day_01_json_modal_class/Constant/app_constant.dart';
import 'package:day_01_json_modal_class/Model/artile_model.dart';
import 'package:http/http.dart' as http;
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
//var arrAllArticles;
  List<Article> arrAllArticles;

  Future getArticleData(String newType) async {
    var response = await http.get(Uri.encodeFull(webServices.getArticles),
        headers: {"Accept": "application/json"});

    Map dictInFlutterCalledMap_Responce;
    List arrInFlutterCalledList_ResponceArrayOfArticles;
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      dictInFlutterCalledMap_Responce = response.body;
      arrInFlutterCalledList_ResponceArrayOfArticles =
          dictInFlutterCalledMap_Responce['articles'];
      return Article.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
    print(response.body);
    arrAllArticles = json.decode(response.body);
    return arrAllArticles;
  }

  @override
  void initState() {
    super.initState();
    getArticleData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
