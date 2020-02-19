import 'package:day_16_01_mobx_default_app/modals/my_counter_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  final MyCounterClass counterModalClassObjc = MyCounterClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Observer(
          builder: (_) {
            return Text(
              '${counterModalClassObjc.counter}',
              style: TextStyle(fontSize: 30),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          counterModalClassObjc.increamentMethod();
        },
      ),
    );
  }
}
