import 'package:flutter/material.dart';
import './screen1.dart';
import './screen2.dart';
import './screen3.dart';

class HomeScreenTopTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar_At_Top'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.favorite)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),
        ),
      ),
    );
  }
}
