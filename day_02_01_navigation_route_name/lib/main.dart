import 'package:flutter/material.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'screen4.dart';
import 'ScreenArguments.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //FIXME: You can only use Either (home) or (initialRoute)
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: MyHomePage.routeName,

      routes: {
        /*
      '/': (context) => MyHomePage(),
      '/Screen1': (context) => Screen1(),
      '/Screen2': (context) => Screen2(),
      */

        MyHomePage.routeName: (context) => MyHomePage(),
        //Screen1.routeName: (context) => Screen1(),
        //Screen2.routeName: (context) => Screen2(),
      },
      onGenerateRoute: (RouteSettings settings) {
        var page;
        String routeName = settings.name;

        switch (routeName) {
          case Screen1.routeName:
            page = Screen1(
              passData: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;

          case Screen2.routeName:
            page = Screen2(
              passData: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;

          case Screen3.routeName:
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguments args = settings.arguments;
            page = Screen3(
              passDataString1: args.passData1,
              passDataStringType2: args.passData2,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        var page;
        page = Screen4(
          //passData: settings.arguments,
          passData:
              'Unknown Route = You have been push screen(), which has Unknown route',
        );
        return MaterialPageRoute(builder: (context) => page);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = "/";

  //FIXME: Commented because Initialroute: can not pass String argument
  //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title ;
  final String title = 'Home Page';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text('Go to Screen 1'),
              onPressed: () {
                Navigator.pushNamed(context, Screen1.routeName,
                    arguments: _counter);
                //If accidentely navigate to the screen which has wrong spelled (routeName)
                //Navigator.pushNamed(context, '/abcd');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
