import 'package:day_07_05_ui_simple_login_screen/login_screen.dart';
import 'package:day_07_05_ui_simple_login_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
      //home: SignUpScreen(),
    );
  }
}
