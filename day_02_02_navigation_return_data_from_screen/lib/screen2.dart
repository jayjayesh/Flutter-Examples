import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  static const String routeName = "/screen2";
  final passData;

  Screen2({this.passData});

  _goBackWithSelectedData(BuildContext context, String strPhoneBrand) {
    Navigator.pop(context, strPhoneBrand);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('Samsung'),
                  onPressed: () {
                    _goBackWithSelectedData(context, 'Samsung');
                  }),
              RaisedButton(
                  child: Text('OnePlus'),
                  onPressed: () {
                    _goBackWithSelectedData(context, 'OnePlus');
                  }),
              RaisedButton(
                  child: Text('Apple'),
                  onPressed: () {
                    _goBackWithSelectedData(context, 'Apple');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Context {}
