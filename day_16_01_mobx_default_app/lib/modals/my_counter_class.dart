import 'package:mobx/mobx.dart';

part 'my_counter_class.g.dart';
// Terminal : flutter packages pub run build_runner watch --delete-conflicting-outputs

class MyCounterClass = _MyCounterClass with _$MyCounterClass;

abstract class _MyCounterClass with Store {
  @observable
  int counter = 0;

  @action
  void increamentMethod() {
    counter++;
  }

  // @observable
  // String firstName = '';
  // @observable
  // String lastName = '';
  // @computed
  // String get fullName => '$firstName $lastName';

  // @action
  // void greetingMethod() {
  //   print('hello $fullName');
  // }

}
