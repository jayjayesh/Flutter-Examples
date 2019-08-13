import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.yellow[100],
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Hi Check'),
              Text(
                'Text Custom font family',
                style: TextStyle(
                  fontFamily: 'google-sans-cufonfonts',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Image.asset(
                'assets/images/girl.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/bird.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/flower.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ]),
      ),
    );
  }
}
