import 'package:day_01_03_parse_json_raywenderlich_github_members/screens/httpGetAllMembers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'raywenderlich.com',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.white,
                child: Text(
                  '(Get) http request',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AllGithubMembers.routeName);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.white,
                child: Text(
                  '(Post) http request',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
