import 'package:af_audio_player/controllers/audio_provider.dart';
import 'package:af_audio_player/modal/route_modal.dart';
import 'package:af_audio_player/views/screens/home_page.dart';
import 'package:af_audio_player/views/screens/playlist.dart';
import 'package:af_audio_player/views/screens/single_song.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AudioProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.red,
        ),
        routes: {
          MyRoutes.home: (context) => HomePage(),
          MyRoutes.songPage: (context) => SongPage(),
          MyRoutes.playListPage: (context) => PlayListPage(),
        },
      ),
    );
  }
}
