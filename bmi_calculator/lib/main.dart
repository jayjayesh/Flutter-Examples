import 'package:bmi_calculator/screens/gridview_orientation.dart';
import 'package:bmi_calculator/screens/home_screen.dart';
import 'constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {

  //Change StatusBar Color
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.orange,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  //Set Whole App orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MaterialApp(
        theme: ThemeData(
          primaryColor: kAppPrimaryColor, //Navigation,
          //primarySwatch: Colors.blue, //kAppPrimaryColor,
          accentColor: kAppSecondaryAccentColor, //Buttun,
          scaffoldBackgroundColor: kAppPrimaryColor,
        ),
        home: GridViewOrientation() //HomeScreen(),
        ),
  );
}
