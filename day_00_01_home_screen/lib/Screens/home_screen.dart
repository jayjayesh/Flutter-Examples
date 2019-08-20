import 'package:day_00_01_home_screen/utils/yourAppName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


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
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Hi Check'),
              Text(
                'Text Custom font family',
                style: TextStyle(
                  fontFamily: YourAppName.font_google_sans_family,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Image.asset(
                YourAppName.img_girl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                YourAppName.img_bird,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                YourAppName.img_flower,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ]),
      ),
    );
  }
}
