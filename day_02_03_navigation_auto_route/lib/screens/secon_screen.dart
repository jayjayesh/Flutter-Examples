import 'package:day_02_03_navigation_auto_route/routes/routes.gr.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String userName;
  final String points;
  const SecondScreen(this.userName, this.points);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondScreen'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('Passed Data'),
            Text('username : $userName \n points:$points'),
            RaisedButton(
              child: Text('go to Third Screen'),
              onPressed: () {
                Router.navigator.pushNamed(Router.thirdScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
