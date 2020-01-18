import 'dart:async';

import 'package:day_14_01_mvvm_articles/pages/articleDetailPage.dart';
import 'package:day_14_01_mvvm_articles/viewmodels/articleListViewModel.dart';
import 'package:day_14_01_mvvm_articles/viewmodels/articleViewModel.dart';
import 'package:day_14_01_mvvm_articles/widgets/articleListWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Provider.of<ArticleListViewModel>(context, listen: false)
          .getTopHeadlineArticles();
    });
  }

  void _gotoArticleDetailScreen(
      BuildContext context, ArticleViewModel articleVM) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetailPage(
          articleViewModel: articleVM,
        ),
      ),
    );
  }

  Widget _buildExpandedListView(BuildContext context, ArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(
          child: Center(child: CircularProgressIndicator()),
        );

      case LoadingStatus.empty:
        return Align(
          child: Text('No result found!'),
        );

      case LoadingStatus.complete:
        return Expanded(
          child: ListViewWidget(
            articles: vm.articles,
            onTapListViewCell: (articleViewModelObjec) {
              _gotoArticleDetailScreen(context, articleViewModelObjec);
            },
          ),
        );

      default:
        return Container(
            child: Text('Something bad happen, Please restart app'));
    }
  }

  Widget _buildSearchTextField(BuildContext context, ArticleListViewModel vm) {
    return Container(
      height: 70,
      child: TextField(
        controller: _textFieldController,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            vm.getArticlesBySearching(value);
          }
        },
        decoration: InputDecoration(
          labelText: 'Enter Search Term',
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          suffix: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _textFieldController.clear();
              vm.getTopHeadlineArticles();
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Top Articles')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildSearchTextField(context, vm),
            SizedBox(height: 10),
            _buildExpandedListView(context, vm)
          ],
        ),
      ),
    );
  }
}
