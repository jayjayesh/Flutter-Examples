import 'package:day_01_04_http_dio_alice/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

GlobalKey<NavigatorState> navigatorKeyMain = GlobalKey<NavigatorState>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      // [1]
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorObservers: [BotToastNavigatorObserver()], // [2]
        navigatorKey: navigatorKeyMain,
        home: HomePage(),
      ),
    );
  }
}
