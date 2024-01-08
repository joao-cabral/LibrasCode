import 'package:librascode/app/core/modules/libras_code_list_module.dart';
import 'package:librascode/app/modules/scan/home/home_controller.dart';
import 'package:librascode/app/modules/scan/home/home_page.dart';
import 'package:provider/provider.dart';

class ScanModule extends LibrasCodeListModule {
  ScanModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (_) => HomeController(),
            )
          ],
          routers: {'/home': (context) => const HomePage()},
        );
}
