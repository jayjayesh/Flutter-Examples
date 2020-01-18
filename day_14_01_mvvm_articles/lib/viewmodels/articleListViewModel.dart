import 'package:day_14_01_mvvm_articles/models/article.dart';
import 'package:day_14_01_mvvm_articles/services/webservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'articleViewModel.dart';

enum LoadingStatus {
  complete,
  searching,
  empty,
}

class ArticleListViewModel with ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;
  List<ArticleViewModel> articles = [];

  Future<void> getTopHeadlineArticles() async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<Article> fetchedArticles =
        await Webservice().fetchTopHeadlineArticles();
    articles = fetchedArticles
        .map((articleTemp) => ArticleViewModel(articleObjc: articleTemp))
        .toList();

    loadingStatus =
        articles.isEmpty ? LoadingStatus.empty : LoadingStatus.complete;
    notifyListeners();
  }

  Future<void> getArticlesBySearching(String keyword) async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<Article> articlesFetched =
        await Webservice().fetchArticleBySearchingKeyword(keyword);
    articles = articlesFetched
        .map((articleTemp) => ArticleViewModel(articleObjc: articleTemp))
        .toList();

    loadingStatus =
        articles.isEmpty ? LoadingStatus.empty : LoadingStatus.complete;
    notifyListeners();
  }
}
