import 'package:flutter/material.dart';

class AlertDialogForDismissCell extends StatelessWidget {
  AlertDialogForDismissCell({this.actionName});
  String actionName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure you want to $actionName?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}

/*

CupertinoAlertDialog(
          content: Text("Are you sure you want to $action?"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text("Ok"),
              onPressed: () {
                // Dismiss the dialog and
                // also dismiss the swiped item
                Navigator.of(context).pop(true);
              },
            ),
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                // Dismiss the dialog but don't
                // dismiss the swiped item
                return Navigator.of(context).pop(false);
              },
            )
          ],
        ),
      )

*/
