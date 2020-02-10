import 'package:day_01_04_http_dio_alice/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //var _spaceBetweenWidgets = 10.0;

  @override
  void initState() {
    super.initState();
    APIService.getInstance().initializeMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: SafeArea(
        child: Container(child: _buildHTTPnDioSection()),
      ),
    );
  }

  Widget _buildHTTPnDioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.grey[800],
          margin: EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text('HTTP', style: TextStyle(color: Colors.white)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
                child: Text('Get'),
                color: Colors.green,
                onPressed: () {
                  APIService.getInstance().getHttpRequest();
                }),
            RaisedButton(
                child: Text('Post'),
                color: Colors.amber,
                onPressed: () {
                  APIService.getInstance().postHttpRequest();
                }),
          ],
        ),
        Container(
          color: Colors.grey[800],
          margin: EdgeInsets.only(top: 50),
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text('Dio', style: TextStyle(color: Colors.white)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
                child: Text('Get'),
                color: Colors.green,
                onPressed: () {
                  APIService.getInstance().getDioRequest();
                }),
            RaisedButton(
                child: Text('Post'),
                color: Colors.amber,
                onPressed: () {
                  APIService.getInstance().postDioRequest();
                }),
          ],
        ),
        Container(
          color: Colors.grey[800],
          margin: EdgeInsets.only(top: 50),
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: RaisedButton(
              child: Text('Show Alice'),
              color: Colors.amber,
              onPressed: () {
                APIService.getInstance().alice.showInspector();
              }),
        ),
      ],
    );
  }
}
