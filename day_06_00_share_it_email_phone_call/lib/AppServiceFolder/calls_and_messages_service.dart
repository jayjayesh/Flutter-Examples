import 'package:url_launcher/url_launcher.dart';

class CallAndMessageServiceClass {
  void callMethod(String number) {
    launch('tel:$number');
  }

  void sendSMSmethod(String number) {
    launch('sms:$number');
  }

  void sendEmailMethod(String strEmail) {
    launch('mailto:$strEmail');
  }

  void openURL(String strURL) async {
    if (await canLaunch(strURL)) {
      await launch(strURL);
    } else {
      //this just print in message in terminal
      throw 'Could not launch $strURL';
    }
  }
}
