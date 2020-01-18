import 'package:day_14_01_mvvm_articles/viewmodels/articleViewModel.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatefulWidget {
  final ArticleViewModel articleViewModel;
  ArticleDetailPage({@required this.articleViewModel});

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  bool isWebViewLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${this.widget.articleViewModel.title}'),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              WebView(
                initialUrl: widget.articleViewModel.articleSourceURL,
                onPageFinished: (value) {
                  setState(() {
                    isWebViewLoading = false;
                  });
                },
              ),
              Visibility(
                visible: isWebViewLoading,
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ));
  }
}
