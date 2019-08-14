import 'package:flutter/material.dart';
import 'custome_widgets/custome_appBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow[100],
      child: Column(
        children: <Widget>[
          //CustomeAppBar(),
          Container(
            height: 50.0,
            color: Colors.red,
          ),
          Container(
            height: 100.0,
            color: Colors.lightBlue,
          ),
          //TODO: This CustomeAppBar is not working
          CustomeAppBar()
        ],
      ),
    );
  }
}
