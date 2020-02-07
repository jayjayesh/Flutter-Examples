import 'package:day_11_02_video_player/widgets/chewieVideoPlayerWidget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

enum VdoControllerType {
  fromAsset,
  fromNetwork,
  fromNetworkErrorLink,
}

class ChewieVideoPlayerPage extends StatefulWidget {
  @override
  _ChewieVideoPlayerPageState createState() => _ChewieVideoPlayerPageState();
}

class _ChewieVideoPlayerPageState extends State<ChewieVideoPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chewie video player')),
      body: Container(
        color: Colors.green,
        child: ChewieVideoPlayerWidget(
            videoPlayerController: getDiffrentTypeOfVideoPlayerController(
                VdoControllerType.fromNetwork)),
      ),
    );
  }

  VideoPlayerController getDiffrentTypeOfVideoPlayerController(
      VdoControllerType type) {
    if (type == VdoControllerType.fromAsset) {
      return VideoPlayerController.asset('videos/SampleVideoWatering.mp4');
    } else if (type == VdoControllerType.fromNetwork) {
      return VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/videos/butterfly.mp4',
      );
    } else if (type == VdoControllerType.fromNetworkErrorLink) {
      return VideoPlayerController.network(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/error.mp4',
      );
    } else {
      //default return assets
      return VideoPlayerController.asset('videos/SampleVideoWatering.mp4');
    }
  }
}
