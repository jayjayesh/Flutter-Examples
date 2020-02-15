part of 'mycounterclass_bloc.dart';

@immutable
abstract class MycounterclassEvent {}

class MyIncreamentMethod extends MycounterclassEvent {}
class MyDecreamentMethod extends MycounterclassEvent {}
