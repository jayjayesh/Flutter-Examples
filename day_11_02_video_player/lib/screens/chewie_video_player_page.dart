import 'package:flutter/material.dart';

class ChewieVideoPlayerPage extends StatefulWidget {
  @override
  _ChewieVideoPlayerPageState createState() => _ChewieVideoPlayerPageState();
}

class _ChewieVideoPlayerPageState extends State<ChewieVideoPlayerPage> {
  String urlVideo =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chewie video player')),
      body: Container(),
    );
  }
}
