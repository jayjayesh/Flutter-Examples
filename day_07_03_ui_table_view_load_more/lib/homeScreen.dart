import 'dart:async';
//import 'dart:ffi';

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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

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
        Timer(const Duration(seconds: 2), () {
          _getMoreItems();
        });
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

  Future<Null> _refreshTableviewGetNewArticles() async {
    return Future.delayed(const Duration(seconds: 2), () {
      arrTableViewItems.insert(0, 'item : ${DateTime.now()}');
      setState(() {
        // Here you can write your code for open new view
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              }),
        ],
      ),
      body: Container(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refreshTableviewGetNewArticles,
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
      ),
    );
  }
}

/*
// (1) Repeat code every 2-second 
// (2) Stop Timer 
// (3) Delay Method Calling


import 'dart:async';

void fetchDataEvery2Second() {
  
  var index = 0;
  Timer.periodic(const Duration(seconds: 2), (Timer timeeer){
    print("Flutter $index");
   index++;
   if(index == 11)
   {
     timeeer.cancel();
   }
  });
}


//--------------------------------

import 'dart:async';

 Timer(const Duration(seconds: 20), (){
    print("Delay Method Calling = Flutter One Shot = Does not repeat");
  });

//--------------------------------

*/
