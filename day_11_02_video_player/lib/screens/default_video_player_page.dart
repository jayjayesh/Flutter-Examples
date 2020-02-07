import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DefaultVideoPlayerPage extends StatefulWidget {
  @override
  _DefaultVideoPlayerPageState createState() => _DefaultVideoPlayerPageState();
}

class _DefaultVideoPlayerPageState extends State<DefaultVideoPlayerPage> {
  VideoPlayerController _vdoPlayerController;
  Future _futureController;

  @override
  void initState() {
    super.initState();
    _vdoPlayerController =
        VideoPlayerController.asset('videos/SampleVideoWatering.mp4');
    //_vdoPlayerController = VideoPlayerController.network('http://static.videokart.ir/clip/100/480.mp4');
    //https://flutter.github.io/assets-for-api-docs/videos/butterfly.mp4
    _futureController = _vdoPlayerController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _vdoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Default video player')),
      floatingActionButton: _buildFloatingActionButton(),
      body: FutureBuilder(
          future: _futureController,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: 16 / 9,
                //aspectRatio: 3 / 2,
                //aspectRatio: _vdoPlayerController.value.aspectRatio,
                child: VideoPlayer(_vdoPlayerController),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
        child: Icon(_vdoPlayerController.value.isPlaying
            ? Icons.pause
            : Icons.play_arrow),
        onPressed: () {
          setState(() {
            if (_vdoPlayerController.value.isPlaying) {
              _vdoPlayerController.pause();
            } else {
              _vdoPlayerController.play();
            }
          });
        });
  }
}

/*

 AspectRatio(
        //aspectRatio: 16/9,
        aspectRatio: _vdoPlayerController.value.aspectRatio,
        child: VideoPlayer(_vdoPlayerController),
      ),

*/
