import 'package:flutter/cupertino.dart';

class ProductModel {
  final String productName;
  final Color productColor;
  int numberOfProducts;
  bool selected;
  ProductModel(this.productName, this.productColor, this.numberOfProducts,
      this.selected);
}
