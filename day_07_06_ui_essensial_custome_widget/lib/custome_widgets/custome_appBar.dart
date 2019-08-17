import 'package:flutter/material.dart';

 //! Must include inside Material App, Otherwise it will Black/Blank screenclass CustomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Container(
        height: 100.0,
        color: Colors.lightBlue,
        child: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              //color: Colors.red,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Text(
                    'Title',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                FlatButton(
                  child: Icon(Icons.search),
                  onPressed: null,
                ),
                SizedBox(
                  width: 5.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
