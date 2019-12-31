import 'package:flutter/material.dart';
import 'package:day_07_08_ui_tab_bar_setup/screen1.dart';
import 'package:day_07_08_ui_tab_bar_setup/screen2.dart';
import 'package:day_07_08_ui_tab_bar_setup/screen3.dart';

class HomeScreenBottomTabBar extends StatefulWidget {
  @override
  _HomeScreenBottomTabBarState createState() => _HomeScreenBottomTabBarState();
}

class _HomeScreenBottomTabBarState extends State<HomeScreenBottomTabBar> {
  var _currentSelectedTabBarIndex = 0;

  List<Widget> _allTabBarScreens = [Screen1(), Screen2(), Screen3()];

  void onTabBarTap(int tapedIndex) {
    setState(() {
      _currentSelectedTabBarIndex = tapedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _allTabBarScreens[_currentSelectedTabBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 50,
        unselectedFontSize: 20,
        currentIndex: _currentSelectedTabBarIndex,
        onTap: onTabBarTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favorite')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Setting')),
        ],
      ),
    );
  }
}
