import 'package:day_03_01_left_menu_properway_pageview/Screens/homeScreen.dart';
import 'package:day_03_01_left_menu_properway_pageview/Screens/screen1.dart';
import 'package:day_03_01_left_menu_properway_pageview/Screens/screen2.dart';
import 'package:day_03_01_left_menu_properway_pageview/Screens/screen3.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class LeftMenuScreenClass extends StatefulWidget {
  @override
  _LeftMenuScreenClassState createState() => _LeftMenuScreenClassState();
}

class _LeftMenuScreenClassState extends State<LeftMenuScreenClass> {
  PageController _pageControllerObj;
  int _currentPageIndex = 0;
  List arrLeftMenuItems = [
    {
      'icon': FontAwesomeIcons.home,
      'name': 'Home',
      'badge': 2,
    },
    {
      'icon': FontAwesomeIcons.inbox,
      'name': 'screen1',
      'badge': 14,
    },
    {
      'icon': FontAwesomeIcons.archive,
      'name': 'screen2',
      'badge': 0,
    },
    {
      'icon': FontAwesomeIcons.trash,
      'name': 'screen3',
      'badge': 0,
    },
  ];

  void onPageChanged(int page) {
    setState(() {
      _currentPageIndex = page;
    });
  }

  void navigationTapped(int page) {
    _pageControllerObj.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageControllerObj = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageControllerObj.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LeftMenu Screen')),
      drawer: leftMenuDrawer(
          context, arrLeftMenuItems, _currentPageIndex, _pageControllerObj),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageControllerObj,
        onPageChanged: onPageChanged,
        children: <Widget>[
          HomeScreenClass(),
          Screen1Class(),
          Screen2Class(),
          Screen3Class(),
        ],
      ),
    );
  }
}

Widget leftMenuDrawer(BuildContext context, List arrLeftMenuItems,
    int _currentPageIndex, PageController _pageControllerObj) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        /*
        DrawerHeader(
          child: Text(
            'Left Menu Header',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
        */
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.blueAccent),
          accountName: Text('Jayesh Lathiya'),
          accountEmail: Text('jayeshlathiya@gmail.com'),
          currentAccountPicture: CircleAvatar(
            //This will not work
            //child: Image.network('https://i.pravatar.cc/150?img=12'),
            //This works
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
          ),
          otherAccountsPictures: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.plusSquare),
              onPressed: () {
                print('Add new Account');
              },
            )
          ],
        ),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount: arrLeftMenuItems.length,
          itemBuilder: (BuildContext context, int index) {
            Map item = arrLeftMenuItems[index];
            int _nNotificationCount = item['badge'];
            return ListTile(
              leading: Icon(
                item['icon'],
                color: _currentPageIndex == index
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.title.color,
              ),
              title: Text(item['name'],
                  style: TextStyle(
                      color: _currentPageIndex == index
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.title.color)),
              trailing: Opacity(
                opacity: _nNotificationCount == 0 ? 0.0 : 1.0,
                child: Chip(
                  label: Text(
                    '$_nNotificationCount',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ),
              ),
              onTap: () {
                _pageControllerObj.jumpToPage(index);
                Navigator.pop(context);
              },
            );
          },
        ),
      ],
    ),
  );
}
