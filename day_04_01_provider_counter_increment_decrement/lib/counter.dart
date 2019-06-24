import 'package:flutter/material.dart';

class CounterClass with ChangeNotifier {
  int _counter;
  CounterClass(this._counter);

  getCounter() => _counter;
  setCounter(int counterObj) => _counter = counterObj;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
