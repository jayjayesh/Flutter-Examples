import 'package:day_06_00_share_it_email_phone_call/AppServiceFolder/appManager.dart';
import 'package:day_06_00_share_it_email_phone_call/AppServiceFolder/calls_and_messages_service.dart';
import 'package:flutter/material.dart';

class HomeScreenClass extends StatelessWidget {
  double nRaisedButtonElevation = 10.0;
  String phoneNumber = '1234567890';
  String strEmail = 'test@test.com?subject=News&body=New%20plugin';
  String strURL = 'https://flutter.io';
  final CallAndMessageServiceClass callAndMsgClassObject =
      sharedAppManager<CallAndMessageServiceClass>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share_it'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                elevation: nRaisedButtonElevation,
                child: Text('Call $phoneNumber'),
                onPressed: () {
                  callAndMsgClassObject.callMethod(phoneNumber);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                elevation: nRaisedButtonElevation,
                child: Text('send SMS to $phoneNumber'),
                onPressed: () {
                  callAndMsgClassObject.sendSMSmethod(phoneNumber);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RaisedButton(
                  elevation: nRaisedButtonElevation,
                  child: Text('send Email to $strEmail'),
                  onPressed: () {
                    callAndMsgClassObject.sendEmailMethod(strEmail);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                elevation: nRaisedButtonElevation,
                child: Text('OpenURL : Flutter homepage'),
                onPressed: () {
                  callAndMsgClassObject.openURL(strURL);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
