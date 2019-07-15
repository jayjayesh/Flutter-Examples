import 'package:day_06_00_share_it_email_phone_call/AppServiceFolder/appManager.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';

void main() {
  setupSharedManagerSingleton();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreenClass(),
    );
  }
}
