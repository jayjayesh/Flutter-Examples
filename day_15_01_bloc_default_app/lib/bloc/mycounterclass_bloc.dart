import 'dart:async'; //For StreamBuilder

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mycounterclass_event.dart';
part 'mycounterclass_state.dart';

class MycounterclassBloc
    extends Bloc<MycounterclassEvent, MycounterclassState> {
  @override
  MycounterclassState get initialState => MycounterclassState(counter: 0);

  @override
  Stream<MycounterclassState> mapEventToState(
      MycounterclassEvent event) async* {
    if (event is MyIncreamentMethod) {
      yield MycounterclassState(counter: state.counter + 1);
    } else if (event is MyDecreamentMethod) {
      yield MycounterclassState(counter: state.counter - 1);
    }
  }
}
