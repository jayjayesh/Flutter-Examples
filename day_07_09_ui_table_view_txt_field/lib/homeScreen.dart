import 'package:day_07_09_ui_table_view_txt_field/product.dart';
import 'package:flutter/material.dart';

const double _TABLE_ROW_HEIGHT = 70.0;
const double _TABLE_ROW_SEPRATOR = 8.0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> _allProducts = [];
  final ScrollController _scrollController = ScrollController();
  final TextEditingController txtEditingCtrl = TextEditingController();

  void _addNewProduct(String name) {
    setState(() {
      //? DeSelect all product
      for (var product in _allProducts) {
        product.selected = false;
      }

      //? Select latest product selected=true, To scrollToLatest product
      _allProducts.insert(0, ProductModel(name, Colors.blue, 1, true));
    });
  }

  Widget _rowAtIndexPath(BuildContext context, int index) {
    return Card(
      child: Container(
        height: _TABLE_ROW_HEIGHT,
        child: Text(_allProducts[index].productName),
      ),
    );
  }

  void _scrollTo() {
    setState(() {
      for (var product in _allProducts) {
        if (product.productName == "Lion" || product.productName == "lion") {
          product.selected = true;
        } else {
          product.selected = false;
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _allProducts.insert(0, ProductModel('Apple', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Ball', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Cat', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Dog', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Elephant', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Fish', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Girl', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Hen', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Jag', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Kite', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Lion', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Man', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Nurs', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Orange', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Polish', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Queen', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Rat', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('School', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Toy', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Umbrela', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Violine', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Wheel', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Xerox', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Yello', Colors.blue, 1, false));
    _allProducts.insert(0, ProductModel('Zee', Colors.blue, 1, false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Scroll to first selected item
    for (int i = 0; i < _allProducts.length; i++) {
      if (_allProducts.elementAt(i).selected) {
        _scrollController.animateTo(
            (i * _TABLE_ROW_HEIGHT) + ((i - 1) * _TABLE_ROW_SEPRATOR),
            duration: new Duration(seconds: 2),
            curve: Curves.ease);
        break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Producs'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: txtEditingCtrl,
                      onSubmitted: (text) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  FlatButton(
                    color: Colors.blue,
                    child: Text('Add'),
                    onPressed: () {
                      //Hide Keyboard
                      FocusScope.of(context).unfocus();

                      if (txtEditingCtrl.text.isEmpty) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Textfield is empty'),
                          duration: Duration(seconds: 3),
                        ));
                      } else {
                        _addNewProduct(txtEditingCtrl.text);
                        txtEditingCtrl.clear();
                      }
                    },
                  ),
                  FlatButton(
                    color: Colors.white,
                    child: Text('Scroll to Lion'),
                    onPressed: _scrollTo,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _allProducts.length,
              itemBuilder: _rowAtIndexPath,
            ),
          ),
        ],
      ),
    );
  }
}
