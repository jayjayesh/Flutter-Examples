// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_counter_class.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyCounterClass on _MyCounterClass, Store {
  final _$counterAtom = Atom(name: '_MyCounterClass.counter');

  @override
  int get counter {
    _$counterAtom.context.enforceReadPolicy(_$counterAtom);
    _$counterAtom.reportObserved();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.context.conditionallyRunInAction(() {
      super.counter = value;
      _$counterAtom.reportChanged();
    }, _$counterAtom, name: '${_$counterAtom.name}_set');
  }

  final _$_MyCounterClassActionController =
      ActionController(name: '_MyCounterClass');

  @override
  void increamentMethod() {
    final _$actionInfo = _$_MyCounterClassActionController.startAction();
    try {
      return super.increamentMethod();
    } finally {
      _$_MyCounterClassActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'counter: ${counter.toString()}';
    return '{$string}';
  }
}
