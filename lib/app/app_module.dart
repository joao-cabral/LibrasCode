import 'package:flutter_modular/flutter_modular.dart';
import 'package:librascode/app/modules/core/core_module.dart';
import 'package:librascode/app/modules/qrcode/qrcode_module.dart';

import 'modules/historic/historic_module.dart';
import 'modules/home/home_module.dart';
import 'modules/video_player/video_player_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
    r.module('/qr-code', module: QRCodeModule());
    r.module('/video-player', module: VideioPlayerModule());
    r.module('/historic', module: HistoricModule());
  }
}
