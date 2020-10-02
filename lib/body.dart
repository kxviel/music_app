import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'tracks.dart';

AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
bool isPlaying = false;

pauseAudio() async {
  await assetsAudioPlayer.pause();
}

stopAudio() async {
  await assetsAudioPlayer.stop();
}

resumeAudio() async {
  await assetsAudioPlayer.play();
}

nextAudio() async {
  await assetsAudioPlayer.next();
}

prevAudio() async {
  await assetsAudioPlayer.previous();
}

playAudio(url) async {
  assetsAudioPlayer.open(
    Audio.file(url),
  );
}

playAudioFromLocalStorage(path) async {
  await assetsAudioPlayer.open(path);
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 300.0,
            child: Center(
              child: AvatarGlow(
                glowColor: Colors.red[200],
                endRadius: 150.0,
                child: Material(
                  elevation: 30.0,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage(
                      'https://cdn.canto.com/app/uploads/2019/11/audio-file-types-34.jpg',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    prevAudio();
                    setState(() {
                      isPlaying = true;
                    });
                  }),
              IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () {
                    if (isPlaying == true) {
                      pauseAudio();

                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      resumeAudio();

                      setState(() {
                        isPlaying = true;
                      });
                    }
                  }),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    nextAudio();
                    setState(() {
                      isPlaying = true;
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: () {
                    stopAudio();
                  }),
              IconButton(
                icon: Icon(Icons.list),
                onPressed: () {
                  Navigator.pushNamed(context, '/tracks');
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
