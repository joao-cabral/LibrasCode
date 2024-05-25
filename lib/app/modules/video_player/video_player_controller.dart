import 'package:mobx/mobx.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../models/historic_model.dart';
import '../../services/historic/historic_service.dart';

part 'video_player_controller.g.dart';

class VideoPlayerController = VideoPlayerControllerBase
    with _$VideoPlayerController;

abstract class VideoPlayerControllerBase with Store {
  final HistoricService _historicService;

  VideoPlayerControllerBase({required HistoricService historicService})
      : _historicService = historicService;

  @readonly
  List<HistoricModel> _historic = [];

  @observable
  bool loading = false;

  @observable
  String videoTitle = '';

  @action
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

  @action
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

  @action
  Future<void> getAll() async {
    loading = true;
    try {
      _historic = await _historicService.getAll();
      loading = false;
    } catch (error) {
      print(error);
    }
  }

  @action
  void getTitle(String title) {
    videoTitle = title;
  }
}
