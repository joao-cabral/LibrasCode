import 'package:flutter_modular/flutter_modular.dart';
import 'package:librascode/app/modules/core/core_module.dart';

import 'modules/home/home_page.dart';
import 'modules/video_player/videio_player_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.module('/video-player', module: VideioPlayerModule());
  }
}
