import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  static const String routeName = "/screen3";
  final passDataString1;
  final passDataStringType2;
  Screen3(
      {@required
          this.passDataString1,
      @required
          this.passDataStringType2}); //passData = Constructer = means = must have to pass while create new Object

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 3'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'passData1:$passDataString1 \n\n passData2:$passDataStringType2',
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                child: Text('Pop to Home Screen'),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.popUntil(
                      context, (Route<dynamic> route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
