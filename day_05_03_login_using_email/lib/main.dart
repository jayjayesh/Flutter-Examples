import 'package:day_05_03_login_using_email/screens/home_page.dart';
import 'package:day_05_03_login_using_email/screens/login_page.dart';
import 'package:day_05_03_login_using_email/screens/register_page.dart';
import 'package:day_05_03_login_using_email/screens/splace_screen.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          //HomePage.routName: (context) => HomePage(),
          LoginPage.routName: (context) => LoginPage(),
          RegisterPage.routName: (context) => RegisterPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          var page;
          String routeName = settings.name;
          if (routeName == HomePage.routName) {
            HomePageArguments arg = settings.arguments;

            page = HomePage(
              displayName: arg.displayName,
              emailId: arg.emailId,
            );
            return MaterialPageRoute(builder: (context) => page);
          } else {
            page = SplashScreen();
            return MaterialPageRoute(builder: (context) => page);
          }
        },
      ),
    );
  }
}
