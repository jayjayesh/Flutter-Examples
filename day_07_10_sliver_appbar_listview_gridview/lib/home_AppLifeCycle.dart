import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        print("App inactive : app get PhoneCall, SMS, Notification");
        break;
      case AppLifecycleState.paused:
        print("App paused : App in background, minimise App");
        break;
      case AppLifecycleState.resumed:
        print("App resumed : app comes in foreground");
        break;
      case AppLifecycleState.suspending:
        print("App Suspended : user have kill the app");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppLifeCycle"),
      ),
      body: Container(
        color: Colors.orange,
        child: Center(
          child: Text('AppLifeCycle Demo App'),
        ),
      ),
    );
  }
}
