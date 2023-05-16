import 'package:af_audio_player/controllers/audio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AudioProvider>(context).open();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Song Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: StreamBuilder(
          stream: AudioProvider.myPlayer.currentPosition,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              Duration? data = snapShot.data;

              double max =
                  AudioProvider.myPlayer.current.value?.audio.duration.inSeconds.toDouble() ?? Duration.zero.inSeconds.toDouble();

              return Column(
                children: [
                  Slider(
                    min: 0,
                    max: max,
                    value: data!.inSeconds.toDouble(),
                    onChanged: (v) {
                      Provider.of<AudioProvider>(context, listen: false).seekSong(seconds: v.toInt());
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${snapShot.data.toString().split('.')[0]}"),
                      Text("${AudioProvider.myPlayer.current.value?.audio.duration.toString().split('.')[0]}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<AudioProvider>(context, listen: false).seek(seconds: data.inSeconds - 10);
                        },
                        icon: const Icon(Icons.skip_previous),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<AudioProvider>(context, listen: false).stopSong();
                        },
                        icon: const Icon(Icons.stop),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<AudioProvider>(context, listen: false).playSong();
                        },
                        icon: const Icon(Icons.play_arrow_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<AudioProvider>(context, listen: false).pauseSong();
                        },
                        icon: const Icon(Icons.pause),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<AudioProvider>(context, listen: false).seek(seconds: data.inSeconds + 10);
                        },
                        icon: const Icon(Icons.skip_next),
                      ),
                    ],
                  ),
                ],
              );
            } else if (snapShot.hasError) {
              return Text(
                snapShot.error.toString(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
