import 'package:flutter_modular/flutter_modular.dart';
import 'package:librascode/app/modules/core/core_module.dart';
import 'package:librascode/app/modules/qrcode/qrcode_controller.dart';

import 'qrcode_page.dart';

class QRCodeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(QRCodeController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const QRCodePage());
  }
}
