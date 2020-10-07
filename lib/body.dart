import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

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

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //album art
            Container(
              width: double.infinity,
              height: 300.0,
              child: Center(
                child: AvatarGlow(
                  glowColor: Colors.black87,
                  endRadius: 150.0,
                  child: Material(
                    elevation: 80.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage(
                        'images/c.gif',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //local
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Local Music:'),
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
                    icon: Icon(Icons.stop),
                    onPressed: () {
                      stopAudio();
                      return isPlaying = false;
                    }),
                IconButton(
                  icon: Icon(Icons.list),
                  onPressed: () {
                    Navigator.pushNamed(context, '/tracks');
                  },
                )
              ],
            ),
            //asset
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Asset Music:'),
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
                    icon: Icon(Icons.stop),
                    onPressed: () {
                      stopAudio();
                      return isPlaying = false;
                    }),
              ],
            ),
            //network
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Network Music:'),
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
                    icon: Icon(Icons.stop),
                    onPressed: () {
                      stopAudio();
                      return isPlaying = false;
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
