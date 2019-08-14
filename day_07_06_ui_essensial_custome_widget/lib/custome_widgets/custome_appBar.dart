import 'package:flutter/material.dart';

//TODO: This CustomeAppBar is not working
class CustomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Container(
        height: 50.0,
        color: Colors.lightBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                'Title',
                textDirection: TextDirection.ltr,
              ),
            ),
            FlatButton(
              child: Icon(Icons.search),
              onPressed: null,
            ),
            SizedBox(
              width: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
