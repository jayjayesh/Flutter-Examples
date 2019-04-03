import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic_Box_App_Test'),
        ),
        body: HelloRectengleWidgetTest(),
      ),
    ),
  );
}

class HelloRectengleWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: 300,
            height: 300,
            color: Colors.greenAccent,
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    child: Text('JL'),
                  ),
                  title: Text('Jayesh Lathiya'),
                  subtitle: Text('iOS Developer'),
                );
              },
            )));
  }
}
