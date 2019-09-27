import 'package:flutter/material.dart';

/*
class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Align(
        alignment: Alignment(0, 0), //! Note: (top-middle-bottom = (-1, 0, +1))
        child: Text(
          'Screen2',
          style: TextStyle(fontSize: 30, backgroundColor: Colors.yellow),
        ),
      ),
    );
  }
}
*/

//! Spacer() widget use
class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        color: Colors.green,
        child: Column(
          children: <Widget>[
            Spacer(),
            Text(
              'Screen2',
              style: TextStyle(fontSize: 30, backgroundColor: Colors.yellow),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
