import 'package:day_15_01_bloc_default_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_15_01_bloc_default_app/bloc/mycounterclass_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demoooo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<MycounterclassBloc>(
        create: (_) => MycounterclassBloc(),
        child: HomePage(),
      ),
    );
  }
}
