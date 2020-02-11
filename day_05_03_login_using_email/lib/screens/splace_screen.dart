import 'dart:async';

import 'package:day_05_03_login_using_email/screens/home_page.dart';
import 'package:day_05_03_login_using_email/screens/login_page.dart';
import 'package:day_05_03_login_using_email/service/firebase_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';

  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  var _visibleActivityIndicator = false;
  int splaceScreenLogoAnimationForSeconds = 3;
  FirebaseAuthService firebaseAuthServiceProviderObjc;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration =
        new Duration(seconds: splaceScreenLogoAnimationForSeconds + 1);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    //New Screen transition = Fade In, Slide-Out bottom
    //Navigator.of(context).pushReplacementNamed(LoginPage.routName);

    setState(() {
      _visibleActivityIndicator = true;
    });

    User currentUser = await firebaseAuthServiceProviderObjc.isUserLoggedIn();
    if (currentUser != null) {
      HomePageArguments arg = HomePageArguments(
          displayName: currentUser.displayName, emailId: currentUser.email);

      Navigator.of(context)
          .pushReplacementNamed(HomePage.routName, arguments: arg);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginPage.routName);
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this,
        duration: new Duration(seconds: splaceScreenLogoAnimationForSeconds));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    firebaseAuthServiceProviderObjc =
        Provider.of<FirebaseAuthService>(context, listen: false);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // new Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //     Padding(
          //       padding: EdgeInsets.only(bottom: 30.0),
          //       child: new Image.asset(
          //         'images/powered_by.png',
          //         height: 25.0,
          //         fit: BoxFit.scaleDown,
          //       ),
          //     )
          //   ],
          // ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'images/logo.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
          Visibility(
            visible: _visibleActivityIndicator,
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
