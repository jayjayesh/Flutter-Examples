import 'package:day_14_01_mvvm_articles/models/article.dart';
import 'package:day_14_01_mvvm_articles/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Webservice {
  Future<List<Article>> fetchTopHeadlineArticles() async {
    final responce = await http.get(Constants.ARTICLE_URL);
    if (responce.statusCode == 200) {
      final result = jsonDecode(responce.body);
      Iterable list = result['articles'] as Iterable;
      return list.map((articleJSON) => Article.fromJSON(articleJSON)).toList();
    } else {
      throw Exception("Failed to fetchTopHeadlineArticles");
    }
  }

  Future<List<Article>> fetchArticleBySearchingKeyword(String keyword) async {
    final response = await http.get(Constants.ARTICLE_URL_FOR(keyword));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'] as Iterable;
      return list.map((articleJSON) => Article.fromJSON(articleJSON)).toList();
    } else {
      throw Exception('Failed to fetchArticleBySearchingKeyword');
    }
  }
}
