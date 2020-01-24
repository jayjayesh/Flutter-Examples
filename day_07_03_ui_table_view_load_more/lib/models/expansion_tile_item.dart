import 'package:flutter/material.dart';

class ExpansionTileItem {
  final String title;
  final List<ExpansionTileChildrenItem> children;

  ExpansionTileItem({@required this.title, @required this.children});
}

class ExpansionTileChildrenItem {
  final String title;
  final String description;
  final String action;

  ExpansionTileChildrenItem(
      {@required this.title, this.description, this.action});
}
