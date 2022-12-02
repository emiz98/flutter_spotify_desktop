import 'package:flutter/cupertino.dart';
import 'package:flutter_spotify_desktop_1/data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
  }
}
