import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_14_01_mvvm_articles/viewmodels/articleViewModel.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final List<ArticleViewModel> articles;
  final Function(ArticleViewModel articleViewModel) onTapListViewCell;

  ListViewWidget({this.articles, this.onTapListViewCell});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: articles == null ? 0 : articles.length,
      separatorBuilder: (_, __) => Divider(),
      itemBuilder: (context, index) {
        final article = articles[index];

        return ListTile(
          onTap: () {
            onTapListViewCell(article);
          },
          title: Text(article.title),
          leading: Container(
            height: 100,
            width: 100,
            child: article.imageURL == null
                ? Image.asset('images/NoImageFound.png')
                : CachedNetworkImage(
                    imageUrl: article.imageURL,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
          ),
        );
      },
    );
  }
}
