import 'package:flutter_modular/flutter_modular.dart';
import 'package:librascode/app/modules/core/core_module.dart';
import 'package:librascode/app/modules/historic/historic_controller.dart';

import 'historic_page.dart';

class HistoricModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(HistoricController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const HistoricPage());
  }
}
