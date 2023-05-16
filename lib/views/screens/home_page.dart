import 'package:af_audio_player/modal/route_modal.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyRoutes.songPage);
              },
              child: const Text("Song"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyRoutes.playListPage);
              },
              child: const Text("Play List"),
            ),
          ],
        ),
      ),
    );
  }
}
