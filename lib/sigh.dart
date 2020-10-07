import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Songsnew extends StatefulWidget {
  @override
  _SongsnewState createState() => _SongsnewState();
}

class _SongsnewState extends State<Songsnew> {
  FlutterAudioQuery audioQuery = new FlutterAudioQuery();
  final assetsAudioPlayer = AssetsAudioPlayer();

  String url;
  List<SongInfo> songs;
  Uint8List list;
  bool gotpath;
  @override
  void initState() {
    super.initState();
    initaudio().whenComplete(() {
      setState(() {
        gotpath = true;
      });
    });
  }

  Future<void> initaudio() async {
    /// getting all songs available on device storage
    songs = await audioQuery.getSongs();
    print(songs);
  }

  @override
  Widget build(BuildContext context) {
    if (gotpath == true) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blueGrey[400],
        child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.merge_type),
                ),
                title: new Text(
                  songs[index].displayName,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                onTap: () {
                  url = null;

                  setState(() {
                    url = songs[index].uri;
                  });
                  assetsAudioPlayer.open(
                    Audio.file(url),
                  );
                },
                onLongPress: () {
                  assetsAudioPlayer.stop();
                  assetsAudioPlayer.dispose();
                },
              );
            }),
      );
    } else {
      return Center(
        child: Text(
          'Loading',
          style: TextStyle(
            color: Colors.black26,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }
  }
}
