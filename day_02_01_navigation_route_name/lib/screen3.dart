import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  static const String routeName = "/screen3";
  final passData;
  Screen3(
      {this.passData}); //passData = Constructer = means = must have to pass while create new Object

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unknown Route'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Unknown Route = You have been push screen(), which has Unknown route',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
