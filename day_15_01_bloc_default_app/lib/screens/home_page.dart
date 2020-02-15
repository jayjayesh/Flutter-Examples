import 'package:flutter/material.dart';
import 'package:day_15_01_bloc_default_app/bloc/mycounterclass_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Must add below line : ignore : otherwise it will show warning to close dart.sink
    //ignore: close_sinks
    final MycounterclassBloc cBloc =
        BlocProvider.of<MycounterclassBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: BlocBuilder<MycounterclassBloc, MycounterclassState>(
          builder: (context, myCounterClassStateObjc) {
            return Text(
              '${myCounterClassStateObjc.counter}',
              style: Theme.of(context).textTheme.display1,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              cBloc.add(MyDecreamentMethod());
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              cBloc.add(MyIncreamentMethod());
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
