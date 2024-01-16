import 'package:librascode/app/modules/video_player/video_player_page.dart';
import 'package:provider/provider.dart';

import '../../core/modules/libras_code_list_module.dart';
import 'video_player_controller.dart';

class VideoPlayerModule extends LibrasCodeListModule {
  VideoPlayerModule()
      : super(bindings: [
          ChangeNotifierProvider(
            create: (_) => VideoPlayerController(),
          ),
        ], routers: {
          '/video-player': (context) => const VideoPlayerPage()
        });
}
