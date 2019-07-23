import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenClass extends StatefulWidget {
  @override
  _HomeScreenClassState createState() => _HomeScreenClassState();
}

class _HomeScreenClassState extends State<HomeScreenClass> {
  List arrTableViewItems;
  int _nBunchCount = 10;
  int _nMaxCount = 100;
  int _nCurrentMax = 0;
  ScrollController _scrollControllerObject = ScrollController();

  @override
  void initState() {
    super.initState();

    arrTableViewItems = List.generate(
      _nBunchCount,
      (int index) {
        return "Item : ${index + 1}";
      },
    );
    _nCurrentMax = arrTableViewItems.length;

    _scrollControllerObject.addListener(() {
      if (_scrollControllerObject.position.pixels ==
          _scrollControllerObject.position.maxScrollExtent) {
        _getMoreItems();
      }
    });
  }

  void _getMoreItems() {
    for (int i = _nCurrentMax; i < (_nCurrentMax + _nBunchCount); i++) {
      //Max 100(_nMaxCount) only permited to add
      if (arrTableViewItems.length < _nMaxCount) {
        arrTableViewItems.add('item : ${i + 1}');
      }
    }

    _nCurrentMax = arrTableViewItems.length;
    setState(() {
      //Refresh Widget
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: ListView.builder(
          controller: _scrollControllerObject,
          itemExtent: 80.0,
          itemCount: arrTableViewItems.length + 1,
          itemBuilder: (BuildContext context, int index) {
            print(
                '\n itemBuilder index == arrTableViewItems.length  ($index == ${arrTableViewItems.length})');
            //At Last Cell
            if (index == arrTableViewItems.length) {
              if (index < _nMaxCount) {
                return CupertinoActivityIndicator();
              } else {
                //if all data loaded, don't shoe activity indicator
                return SizedBox(
                  height: 0.0,
                );
              }
            }

            //All Normal Cell
            return ListTile(
              title: Text(arrTableViewItems[index]),
            );
          },
        ),
      ),
    );
  }
}
