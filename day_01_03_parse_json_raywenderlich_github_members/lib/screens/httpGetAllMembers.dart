import 'dart:convert';

import 'package:day_01_03_parse_json_raywenderlich_github_members/models/member.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllGithubMembers extends StatefulWidget {
  static const String routeName = '/AllGithubMembers';

  @override
  _AllGithubMembersState createState() => _AllGithubMembersState();
}

class _AllGithubMembersState extends State<AllGithubMembers> {
  var _listMembers = <Member>[];

  @override
  void initState() {
    super.initState();
    _callWebserviceToLoadAllGithubMembers();
  }

  _callWebserviceToLoadAllGithubMembers() async {
    String strURL = 'https://api.github.com/orgs/raywenderlich/members';
    http.Response httpResponseAllMembers = await http.get(strURL);
    setState(() {
      var jsonResponse = jsonDecode(httpResponseAllMembers.body);

      for (var jsonMember in jsonResponse) {
        final memberModell =
            Member(jsonMember['login'], jsonMember['avatar_url']);
        _listMembers.add(memberModell);
      }
    });
  }

  Widget _buildRow(int index) {
    var strMemberName = _listMembers[index].loginName;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(_listMembers[index].avatarURL),
        ),
        title: Text('$strMemberName'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Github'),
        ),
        body: ListView.separated(
          itemCount: _listMembers.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int indexx) {
            return _buildRow(indexx);
          },
        ),
      ),
    );
  }
}
