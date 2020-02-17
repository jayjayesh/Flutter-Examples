import 'package:flutter/material.dart';
import './screen1.dart';
import './screen2.dart';
import './screen3.dart';

class HomeScreenTopTabBar extends StatefulWidget {
  @override
  _HomeScreenTopTabBarState createState() => _HomeScreenTopTabBarState();
}

class _HomeScreenTopTabBarState extends State<HomeScreenTopTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar_At_Top_pepsi'),
            bottom: TabBar(
              controller: _tabController,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.favorite)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
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

/*

---------------------------
How to implement TopTabBar (under navigationBar)
----------------------------
List<Tab> _tabs
List<Widget> _pages
TabController _tabController

Column(
	children: [
		TabBar ( controller: _tabController, tabs: _tabs,  )
		TabBarView( controller: _tabController,  children: _pages )
	]
)
----------------------------

*/
