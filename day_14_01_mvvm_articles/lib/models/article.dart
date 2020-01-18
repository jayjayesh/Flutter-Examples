class Article {
  final String title;
  final String description;
  final String imageURL;
  final String articleSourceURL;
  Article({this.title, this.description, this.imageURL, this.articleSourceURL});

  factory Article.fromJSON(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      imageURL: json['urlToImage'],
      articleSourceURL: json['url'],
    );
  }
}
