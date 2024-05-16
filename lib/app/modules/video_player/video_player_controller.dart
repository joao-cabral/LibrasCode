import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../models/historic_model.dart';
import '../../services/historic/historic_service.dart';

class VideoPlayerController {
  final HistoricService _historicService;

  VideoPlayerController({required HistoricService historicService})
      : _historicService = historicService;

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
    await _historicService.save(HistoricModel(
      videoId: metadata.videoId,
      author: metadata.author,
      title: metadata.title,
    ));
  }
}
