import 'package:flutter/material.dart';
import 'custome_widgets/custome_appBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custome',
      home: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellow[100],
        child: Column(
          children: <Widget>[
            //?: Must include inside Material App, Otherwise it will Black/Blank screen
            CustomeAppBar()
          ],
        ),
      ),
    );
  }
}
