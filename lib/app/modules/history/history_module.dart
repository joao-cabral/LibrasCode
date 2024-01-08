import 'package:librascode/app/core/modules/libras_code_list_module.dart';
import 'package:librascode/app/modules/history/history_controller.dart';
import 'package:librascode/app/modules/history/history_page.dart';
import 'package:provider/provider.dart';

class HistoryModule extends LibrasCodeListModule {
  HistoryModule()
      : super(bindings: [
          ChangeNotifierProvider(
            create: (_) => HistoryController(),
          ),
        ], routers: {
          '/history': (context) => const HistoryPage()
        });
}
