import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _homeScreenText = "Waiting for token...";
  String _messageText = "Waiting for message...";

  @override
  void initState() {
    super.initState();

    firebaseCloudMessagingConfiguration();
  }

  void firebaseCloudMessagingConfiguration() {
    _firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch called');
        setState(() {
          _messageText = "Push Messaging message: \n $message";
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume called');
        setState(() {
          _messageText = "Push Messaging message: \n $message";
        });
      },
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage called');
        setState(() {
          _messageText = "Push Messaging message: \n $message";
        });
      },
    );
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(
      sound: true,
      badge: true,
      alert: true,
    ));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print('Hello');
    });
    _firebaseMessaging.getToken().then((token) async {
      assert(token != null);
      setState(() {
        _homeScreenText = "Push Messaging token: \n $token";
      });
      print('Token is = $token'); // Print the Token in Console
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notification'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(_homeScreenText),
            SizedBox(height: 20),
            Text(_messageText),
          ],
        ),
      ),
    );
  }
}
