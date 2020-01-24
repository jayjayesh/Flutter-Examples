import 'package:day_14_01_mvvm_star_wars_movie/pages/home_page.dart';
import 'package:day_14_01_mvvm_star_wars_movie/viewmodels/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //Alice alice = Alice(showNotification: true, showInspectorOnShake: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //navigatorKey: alice.getNavigatorKey(),
      title: 'MaterialApp Title',
      theme: ThemeData(
        textTheme: GoogleFonts.fugazOneTextTheme(),
      ),
      home: ChangeNotifierProvider(
        create: (context) => HomePageViewModel(),
        child: HomePage(),
      ),
    );
  }
}
