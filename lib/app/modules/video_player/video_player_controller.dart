import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerController {
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
}
