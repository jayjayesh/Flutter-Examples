import 'package:day_07_14_ui_quiz_app_2/appManager.dart';
import 'package:day_07_14_ui_quiz_app_2/constants.dart';
import 'package:flutter/material.dart';

AppManager appManagerObjc = AppManager();

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                    child: Text(
                  appManagerObjc.getStoryTitleString(),
                  style: kStoryTitleTextStyle,
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  flex: 2,
                  child: RaisedButton(
                    color: Colors.red,
                    child: Text(appManagerObjc.getChoice1String(),
                        style: kStoryChoseTextStyle),
                    onPressed: () {
                      appManagerObjc.nextStory(selectedChoice: 1);
                      setState(() {});
                    },
                  )),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: appManagerObjc.isChoice2Visible(),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      appManagerObjc.getChoice2String(),
                      style: kStoryChoseTextStyle,
                    ),
                    onPressed: () {
                      appManagerObjc.nextStory(selectedChoice: 2);
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
