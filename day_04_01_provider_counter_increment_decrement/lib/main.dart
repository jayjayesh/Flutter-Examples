import 'package:day_04_01_provider_counter_increment_decrement/counter.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hi Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        builder: (_) {
          return CounterClass(0);
        },
        child: homeScreen(),
      ),
    );
  }
}
