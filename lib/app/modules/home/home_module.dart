import 'package:flutter_modular/flutter_modular.dart';
import 'package:librascode/app/modules/home/menu_page/privacy_policy.dart';

import '../core/core_module.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'menu_page/about_page.dart';
import 'menu_page/feedback_page.dart';

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
    r.child(
      '/about',
      child: (_) => const AboutPage(),
    );
    r.child(
      '/feedback',
      child: (_) => const FeedbackPage(),
    );
    r.child(
      '/privacy-policy',
      child: (_) => const PrivacyPolicyPage(),
    );
  }
}
