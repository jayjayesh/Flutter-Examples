import 'package:day_02_03_navigation_auto_route/routes/routes.gr.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ThirdScreen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('go to Home Screen'),
          onPressed: () {
            //Router.navigator.popUntil(ModalRoute.withName(Router.homeScreen));
            Navigator.pop(context, 'Car');
            //Router.navigator.pop();
          },
        ),
      ),
    );
  }
}
