import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';

class AudioProvider extends ChangeNotifier {
  static AssetsAudioPlayer myPlayer = AssetsAudioPlayer();

  open() async {
    await myPlayer.open(
      Audio(
        "assets/audio/Jai_Shri_Ram.mp3",
      ),
      autoStart: false,
    );
  }

  Future<void> playSong() async {
    await myPlayer.play();
  }

  Future<void> seekSong({required int seconds}) async {
    await myPlayer.seekBy(
      Duration(seconds: seconds),
    );
  }

  Future<void> seek({required int seconds}) async {
    await myPlayer.seek(
      Duration(seconds: seconds),
    );
  }

  Future<void> stopSong() async {
    await myPlayer.stop();
  }

  Future<void> pauseSong() async {
    await myPlayer.pause();
  }
}
