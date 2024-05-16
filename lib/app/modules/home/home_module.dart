import 'package:flutter_modular/flutter_modular.dart';
import 'package:librascode/app/modules/core/core_module.dart';
import 'package:librascode/app/modules/home/home_controller.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    i.addLazySingleton(HomeController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => HomePage(
        controller: Modular.get<HomeController>(),
      ),
    );
  }
}
