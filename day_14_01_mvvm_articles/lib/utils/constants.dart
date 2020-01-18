class Constants {
  static const String BASE_URL = 'https://newsapi.org/v2/';
  static const String ARTICLE_API_KEY = 'YourPriveteKey';

  static const String ARTICLE_URL =
      BASE_URL + 'top-headlines?country=us&apiKey=$ARTICLE_API_KEY';

  static String ARTICLE_URL_FOR(String keyword) {
    return BASE_URL + "everything?q=$keyword&apiKey=$ARTICLE_API_KEY";
  }
}
