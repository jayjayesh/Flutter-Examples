import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class HomeScreen extends StatelessWidget {
  void playSound(int audioNumber) {
    final player = AudioCache();
    player.play('note$audioNumber.wav');
    //player.play('assets/note1.wav');
  }

  Expanded createButton({Color buttonColor, int audioNumber}) {
    return Expanded(
        child: FlatButton(
      child: Text(''),
      color: buttonColor,
      onPressed: () {
        playSound(audioNumber);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        createButton(buttonColor: Colors.red, audioNumber: 1),
        createButton(buttonColor: Colors.orange, audioNumber: 2),
        createButton(buttonColor: Colors.yellow, audioNumber: 3),
        createButton(buttonColor: Colors.green, audioNumber: 4),
        createButton(buttonColor: Colors.teal, audioNumber: 5),
        createButton(buttonColor: Colors.blue, audioNumber: 6),
        createButton(buttonColor: Colors.purple, audioNumber: 7),
      ],
    );
  }
}
