import 'package:flutter/material.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  static const String routeName = "/screen1";
  final passData;
  Screen1(
      {this.passData}); //passData = Constructer = means = must have to pass while create new Object

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: Text('Passed data = $passData')),
              RaisedButton(
                child: Text('Go to Screen 2'),
                onPressed: () {
                  Navigator.pushNamed(context, Screen2.routeName,
                      arguments: 'welcome to screen 2');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
