import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  static const String routeName = "/screen4";
  final passData;
  Screen4(
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
                  passData,
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
