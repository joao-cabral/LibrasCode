import 'package:flutter_modular/flutter_modular.dart';
import 'package:librascode/app/modules/video_player/video_player_controller.dart';
import 'package:provider/provider.dart';

import '../core/core_module.dart';
import 'video_player_page.dart';

class VideioPlayerModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    i.addLazySingleton(VideoPlayerController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => ChangeNotifierProvider(
        create: (context) => Modular.get<VideoPlayerController>(),
        child: VideoPlayerPage(
          videoId: r.args.queryParams['videoId'],
          controller: Modular.get<VideoPlayerController>(),
        ),
      ),
    );
  }
}
