import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  static const String routeName = "/screen2";
  final passData;
  Screen2({this.passData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('passed Data = $passData'),
                RaisedButton(
                  child: Text('Go Back to (Home screen)'),
                  onPressed: () {
                    //Previous
                    //Navigator.pop(context);

                    //Pop-to-Root-ViewController
                    //Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                    //Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
