import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

class homeScreen extends StatelessWidget {
  static const String routeName = "/homeScreen";
  final passData;

  homeScreen({this.passData});

  @override
  Widget build(BuildContext context) {
    final localCounterClassObject = Provider.of<CounterClass>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi HomeScreen'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed Button'),
              Text('${localCounterClassObject.getCounter()}'),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: 'Increment',
            onPressed: localCounterClassObject.incrementCounter,
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            tooltip: 'Decrement',
            onPressed: localCounterClassObject.decrementCounter,
          )
        ],
      ),
    );
  }
}

mixin counter {}
