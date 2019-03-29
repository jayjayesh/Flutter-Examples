import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePageEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _arrAllUsers = [];

  @override
  void initState() {
    super.initState();
    fetchTableViewData();
  }

/* 
  void fetchTableViewData() {
    _arrAllUsers = [
      {
        'name': 'Jayesh Lathiya',
        'description':
            'how abount long description which should be cut at the end of table row'
      },
      {
        'name': 'Amit Lathiya',
        'description':
            'how abount long description which should be cut at the end of table row'
      },
      {
        'name': 'Kumar Lathiya',
        'description':
            'how abount long description which should be cut at the end of table row'
      },
      {
        'name': 'Prasant Lathiya',
        'description':
            'how abount long description which should be cut at the end of table row'
      },
      {
        'name': 'Last Lathiya',
        'description':
            'Last how abount long description which should be cut at the end of table row'
      }
    ];
  } */

  Future<void> fetchTableViewData() async {
    var _jsonFileData = await rootBundle.loadString('lib/assetsss/user.json');
    var _dictUserFileData = json.decode(_jsonFileData);

    setState(() {
      _arrAllUsers = _dictUserFileData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        height: 400,
        width: 300,
        color: Colors.greenAccent,
        child: ListView.separated(
          itemCount: _arrAllUsers.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            var _dictUser = _arrAllUsers[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text('JL'),
                backgroundColor: Colors.blueAccent,
              ),
              title: Text(_dictUser['name']),
              subtitle: Text(
                _dictUser['description'],
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ),
    );
  }
}
