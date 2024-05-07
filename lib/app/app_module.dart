import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_page.dart';
import 'modules/video_player/video_player_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child(
      '/video-player',
      child: (context) =>
          VideoPlayerPage(videoId: r.args.queryParams['videoId']),
    );
  }
}
