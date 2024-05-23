import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../models/historic_model.dart';
import '../../services/historic/historic_service.dart';

class VideoPlayerController extends ChangeNotifier {
  final HistoricService _historicService;

  VideoPlayerController({required HistoricService historicService})
      : _historicService = historicService;

  List<HistoricModel> historic = [];
  bool loading = false;
  String videoTitle = '';

  YoutubePlayerController configYoutubePLayer(String videoId) {
    return YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );
  }

  Future<void> saveVideo(YoutubeMetaData metadata) async {
    await _historicService.save(
      HistoricModel(
        videoId: metadata.videoId,
        author: metadata.author,
        title: metadata.title,
        watchDate: DateTime.now(),
      ),
    );
  }

  Future<void> getAll() async {
    loading = true;
    try {
      historic = await _historicService.getAll();
      loading = false;
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  void getTitle(String title) {
    videoTitle = title;
    notifyListeners();
  }
}
