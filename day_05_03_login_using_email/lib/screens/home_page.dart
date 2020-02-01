import 'package:day_05_03_login_using_email/screens/login_page.dart';
import 'package:day_05_03_login_using_email/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routName = 'HomePage';
  //final FirebaseUser loggedinUser;
  final String displayName;
  final String emailId;
  HomePage({@required this.displayName, @required this.emailId});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _sighoutButtonClicked() {
    try {
      FirebaseAuth.instance.signOut();
      _cleareTempDataOfSignedoutUser();
    } catch (err) {
      throw Exception('fail to signout');
    }
  }

  _cleareTempDataOfSignedoutUser() {
    // Navigator.popUntil(
    //     context, ModalRoute.withName(Navigator.defaultRouteName));
    //Navigator.pushReplacementNamed(context, LoginPage.routName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: _sighoutButtonClicked(),
            child: Text("Logout"),
            //By setting the shape property to CircleBorder, we get a nicer effect for the pressed state.
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'You are logged in /n Successfully',
                style: Constants.textStyleLoggedInSuccessfully,
              ),
              SizedBox(height: Constants.heightBetweenWidgets),
              Text('Your name = ${widget.displayName}'),
              SizedBox(height: Constants.heightBetweenWidgets),
              Text('Your email = ${widget.emailId}'),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageArguments {
  final String displayName;
  final String emailId;
  HomePageArguments({@required this.displayName, @required this.emailId});
}
