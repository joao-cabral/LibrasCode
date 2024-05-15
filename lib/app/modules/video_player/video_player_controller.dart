import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../models/history_model.dart';
import '../../services/history/history_service.dart';

class VideoPlayerController {
  final HistoryService _historyService;

  VideoPlayerController({required HistoryService historyService})
      : _historyService = historyService;

  bool isPop = false;

  void popScope(bool value) {
    isPop = value;
  }

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
    await _historyService.save(HistoryModel(
      videoId: metadata.videoId,
      author: metadata.author,
      title: metadata.title,
    ));
  }
}
