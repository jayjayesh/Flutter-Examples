import 'package:day_02_03_navigation_auto_route/routes/routes.gr.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  final String userId;
  const FirstScreen({@required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstScreen'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('Passed Data'),
            Text('$userId'),
            RaisedButton(
              child: Text('go to Second Screen'),
              onPressed: () {
                Router.navigator.pushNamed(Router.secondScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
