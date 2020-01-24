// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:day_02_03_navigation_auto_route/screens/home_screen.dart';
import 'package:day_02_03_navigation_auto_route/screens/first_screen.dart';
import 'package:day_02_03_navigation_auto_route/screens/secon_screen.dart';
import 'package:day_02_03_navigation_auto_route/screens/third_screen.dart';
import 'package:auto_route/transitions_builders.dart';

class Router {
  static const homeScreen = '/';
  static const firstScreen = '/firstScreen';
  static const secondScreen = '/secondScreen';
  static const thirdScreen = '/thirdScreen';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      case Router.firstScreen:
        if (hasInvalidArgs<String>(args, isRequired: true)) {
          return misTypedArgsRoute<String>(args);
        }
        final typedArgs = args as String;
        return MaterialPageRoute(
          builder: (_) => FirstScreen(userId: typedArgs),
          settings: settings,
        );
      case Router.secondScreen:
        if (hasInvalidArgs<SecondScreenArguments>(args)) {
          return misTypedArgsRoute<SecondScreenArguments>(args);
        }
        final typedArgs =
            args as SecondScreenArguments ?? SecondScreenArguments();
        return CupertinoPageRoute(
          builder: (_) => SecondScreen(typedArgs.userName, typedArgs.points),
          settings: settings,
          fullscreenDialog: true,
        );
      case Router.thirdScreen:
        return PageRouteBuilder(
          pageBuilder: (ctx, animation, secondaryAnimation) => ThirdScreen(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          transitionDuration: Duration(milliseconds: 200),
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//SecondScreen arguments holder class
class SecondScreenArguments {
  final String userName;
  final String points;
  SecondScreenArguments({this.userName, this.points});
}
