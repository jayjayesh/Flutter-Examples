import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  Widget _myBox(String titleThatPassed, Color colorThatPassed) {
    return Container(
      decoration: BoxDecoration(color: colorThatPassed),
      child: Text(
        titleThatPassed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('myBox_Widget'),
        ),
        body: Container(
          child: Container(
            decoration: BoxDecoration(color: Colors.yellow[100]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _myBox('First', Colors.red),
                _myBox('Second', Colors.green),
                _myBox('Third', Colors.blue),
              ],
            ),
          ),
        ));
  }
}
