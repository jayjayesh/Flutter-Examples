import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';

class DefaultVideoPlayerPage extends StatefulWidget {
  @override
  _DefaultVideoPlayerPageState createState() => _DefaultVideoPlayerPageState();
}

class _DefaultVideoPlayerPageState extends State<DefaultVideoPlayerPage> {
  String urlVideo =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Default video player')),
      body: Container(),
    );
  }
}
