import 'dart:developer';
import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_desktop_1/data/data.dart';
import 'package:flutter_spotify_desktop_1/models/current_track_model.dart';
import 'package:flutter_spotify_desktop_1/screens/playListScreen.dart';
import 'package:flutter_spotify_desktop_1/widgets/current_track.dart';
import 'package:flutter_spotify_desktop_1/widgets/side_menu.dart';
import 'package:provider/provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }
  runApp(ChangeNotifierProvider(
      create: (context) => CurrentTrackModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        backgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        accentColor: const Color(0xFF1DB954),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          ),
          bodyText1: TextStyle(
            color: Colors.grey[300],
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodyText2: TextStyle(
            color: Colors.grey[300],
            letterSpacing: 1.0,
          ),
        ),
      ),
      home: Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> load() async {
      var yt = YoutubeExplode();
      var streamInfo = await yt.videos.streamsClient.getManifest('fRh_vgS2dFE');
      print(streamInfo);
      yt.close();
    }

    void initState() {
      load();
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              if (MediaQuery.of(context).size.width > 800) SideMenu(),
              Expanded(
                child: PlayListScreen(
                  playlist: lofihiphopPlaylist,
                ),
              ),
            ],
          )),
          CurrentTrack(),
        ],
      ),
    );
  }
}
