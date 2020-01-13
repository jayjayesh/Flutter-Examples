import 'package:day_02_03_navigation_auto_route/routes/routes.gr.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedTransitionType = 'select type from third screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text('Go to First Screen'),
            onPressed: () {
              Router.navigator.pushNamed(
                Router.firstScreen,
                arguments: 'user_id:143',
              );
            },
          ),
          SizedBox(
            height: 5,
          ),
          RaisedButton(
            child: Text('Go to Second Screen'),
            onPressed: () {
              Router.navigator.pushNamed(Router.secondScreen,
                  arguments: SecondScreenArguments(
                    userName: 'piter',
                    points: '145',
                  ));

              setState(() {
                selectedTransitionType = ''; //result;
              });
            },
          ),
          SizedBox(
            height: 5,
          ),
          RaisedButton(
            child: Text('Go to Third Screen'),
            onPressed: () async {
              var result = await Router.navigator.pushNamed(Router.thirdScreen);
              setState(() {
                selectedTransitionType = result;
              });
            },
          ),
          SizedBox(
              height: 200,
              child: Card(
                child: Center(child: Text('$selectedTransitionType')),
              )),
        ],
      ),
    );
  }
}
