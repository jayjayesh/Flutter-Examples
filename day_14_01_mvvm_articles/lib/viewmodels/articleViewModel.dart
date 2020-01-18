import 'package:day_14_01_mvvm_articles/models/article.dart';

class ArticleViewModel {
  Article _article;
  ArticleViewModel({Article articleObjc}) : _article = articleObjc;

  String get title {
    return _article.title;
  }

  String get description {
    return _article.description;
  }

  String get imageURL {
    return _article.imageURL;
  }

  String get articleSourceURL {
    return _article.articleSourceURL;
  }
}
