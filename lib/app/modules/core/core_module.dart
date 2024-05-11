import 'package:flutter_modular/flutter_modular.dart';

import '../../core/database/sqlite_connection_factory.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(SqliteConnectionFactory.new);
  }
}
