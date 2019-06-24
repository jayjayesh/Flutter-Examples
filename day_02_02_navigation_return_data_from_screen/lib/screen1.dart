import 'package:flutter/material.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  static const String routeName = "/screen1";
  final passData;

  Screen1(
      {this.passData}); //passData = Constructer = means = must have to pass while create new Object

  showAlertDialog(BuildContext context, String title, String subTitle) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(subTitle),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _navigateAndDisplaySelectionData(BuildContext context) async {
    final selectedData = await Navigator.pushNamed(context, Screen2.routeName);
    print('$selectedData');
    //Scaffold.of(context).removeCurrentSnackBar();
    //Scaffold.of(context).showSnackBar(SnackBar(
    //   content: Text('$selectedData'),
    //));

    showAlertDialog(context, 'My Title', 'You Selected : ($selectedData' + ')');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen1'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Select Phone Brand'),
          onPressed: () {
            _navigateAndDisplaySelectionData(context);
          },
        ),
      ),
    );
  }
}
