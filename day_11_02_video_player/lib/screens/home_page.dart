import 'package:day_11_02_video_player/screens/chewie_video_player_page.dart';
import 'package:day_11_02_video_player/screens/default_video_player_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  Widget _buildListView(BuildContext context) {
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      ListTile(
        title: Text('Default Video Player'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DefaultVideoPlayerPage(),
            ),
          );
        },
      ),
      Divider(),
      ListTile(
        title: Text('Chewie Video Player'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChewieVideoPlayerPage(),
            ),
          );
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      //body: Container(),
      body: SafeArea(child: _buildListView(context)),
    );
  }
}
