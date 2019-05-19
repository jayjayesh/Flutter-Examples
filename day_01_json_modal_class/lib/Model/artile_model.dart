import 'package:flutter/material.dart';

/*
class ArticleAPIResponce {

  final String status;
  final int totalResults;
  final [Article] arrAllArticles;

    ArticleAPIResponce(
      this.status,
      this.totalResults,
      this.arrAllArticles,
    );

factory ArticleAPIResponce.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to (ArticleAPIResponce)");
    }

    return ArticleAPIResponce(
       status: json['status'] as String,
       totalResults: json['totalResults'] as int,
       arrAllArticles: json['articles'] as [Article],
       );
  }

}
*/

class Article {
  final String title;
  final String description;
  final String author;
  final String content;
  final String url;
  final String urlToImage;
  final String publishAt;
  final Source source;

  Article(
      {this.title,
      this.description,
      this.author,
      this.content,
      this.url,
      this.urlToImage,
      this.publishAt,
      this.source});

  factory Article.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to (Article)");
    }

    return Article(
      title: json['title'] as String,
      description: json['description'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishAt: json['publishedAt'] as String,
      source: Source.fromJson(json['source']),
    );
  }
}

class Source {
  final String id;
  final String name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to (Source)");
    }

    return Source(id: json['id'] as String, name: json['name'] as String);
  }
}
