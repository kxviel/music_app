import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

final assetsAudioPlayer = AssetsAudioPlayer();
bool isPlaying = false, assetPlay = false, netPlay = false;
var stat;
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

playAssetAudio() {
  assetsAudioPlayer.open(Audio('assets/audio/Blink182.mp3'));
}

playNetAudio() async {
  await assetsAudioPlayer.open(Audio.network(
      'https://raw.githubusercontent.com/kevkanae/test/master/Krewella%20-%20Greenlights%20(Official%20Music%20Video)%20(%20160kbps%20).mp3'));
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
                FlatButton(
                    onPressed: () async {
                      stat = await Navigator.pushNamed(context, '/tracks');
                      print(stat);
                      setState(() {
                        isPlaying = stat;
                      });
                    },
                    child: Text('S E L E C T')),
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
                      assetsAudioPlayer.dispose();
                      return isPlaying = false;
                    }),

              ],
            ),
            //asset
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Asset Music:'),
                IconButton(
                    icon: Icon(assetPlay ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      if (assetPlay == true) {
                        pauseAudio();

                        setState(() {
                          assetPlay = false;
                        });
                      } else {
                        playAssetAudio();

                        setState(() {
                          assetPlay = true;
                        });
                      }
                    }),
                IconButton(
                    icon: Icon(Icons.stop),
                    onPressed: () {
                      stopAudio();
                      assetsAudioPlayer.dispose();
                      setState(() {
                        assetPlay = false;
                      });
                    }),
              ],
            ),
            //network
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Network Music:'),
                IconButton(
                    icon: Icon(netPlay ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      if (netPlay == true) {
                        pauseAudio();

                        setState(() {
                          netPlay = false;
                        });
                      } else {
                        playNetAudio();

                        setState(() {
                          netPlay = true;
                        });
                      }
                    }),
                IconButton(
                    icon: Icon(Icons.stop),
                    onPressed: () {
                      stopAudio();
                      assetsAudioPlayer.dispose();
                      setState(() {
                        netPlay = false;
                      });
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
