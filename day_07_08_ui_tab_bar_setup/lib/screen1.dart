import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Align(
        //alignment: Alignment.topCenter,
        alignment:
            Alignment(0, -0.9), //! Note: (top-middle-bottom = (-1, 0, +1))
        child: Text(
          'Screen1',
          style: TextStyle(fontSize: 32.0, backgroundColor: Colors.yellow),
        ),
      ),
    );
  }
}
