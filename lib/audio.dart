import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Music {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  Duration duration, position = Duration();
  bool _isPlaying = false;

  assetplay() async {
    await audioPlayer.play('audio/1.mp3');
  }

  playAudioFromLocalStorage(path) async {
    await audioPlayer.play(path, isLocal: true);
  }

  pauseAudio() async {
    await audioPlayer.pause();
  }

  stopAudio() async {
    await audioPlayer.stop();
  }

  resumeAudio() async {
    await audioPlayer.resume();
  }
}
