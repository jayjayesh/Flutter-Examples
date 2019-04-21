import 'package:flutter/material.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  static const String routeName = "/screen1";
  final passData;
  Screen1({this.passData});

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
                Text('passed Data = $passData'),
                RaisedButton(
                  child: Text('Go to screen 2'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Screen2(
                        passData: 'Hi I am from Screen 1',
                      );
                    }));
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
