class Article {
  final String title;
  final String description;
  final String imageURL;
  final String articleSourceURL;
  Article({this.title, this.description, this.imageURL, this.articleSourceURL});

  factory Article.fromJSON(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title Found',
      description: json['description'] ?? 'No Description Found',
      imageURL: json['urlToImage'] ?? 'https://via.placeholder.com/150',
      articleSourceURL: json['url'] ??
          'https://via.placeholder.com/468x60?text=visite+article.com+now',
    );
  }
}
