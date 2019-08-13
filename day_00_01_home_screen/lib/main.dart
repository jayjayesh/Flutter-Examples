import 'package:flutter/material.dart';
import 'package:day_00_01_home_screen/Screens/home_screen.dart';
import 'package:flutter/services.dart';

//void main() => runApp(MyApp());

// void main() {
//   runApp(MyApp());
// }

Future<void> main() async {
//StatusBar change color
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

//Application Fixed in  (portrait) mode only
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

// Do any initialisation: Shared_prefrence, Singleton, etc

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
