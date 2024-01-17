import 'package:flutter/material.dart';

class VideoPlayerController extends ChangeNotifier {
  bool isPop = false;

  void popScope(bool value) {
    isPop = value;
    notifyListeners();
  }
}
