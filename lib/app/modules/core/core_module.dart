import 'package:flutter_modular/flutter_modular.dart';
import 'package:librascode/app/repositories/history/history_repository_impl.dart';
import 'package:librascode/app/services/history/history_service_impl.dart';

import '../../repositories/history/history_repository.dart';
import '../../services/history/history_service.dart';
import 'database/sqlite_connection_factory.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(SqliteConnectionFactory.new);
    i.add<HistoryRepository>(HistoryRepositoryImpl.new);
    i.add<HistoryService>(HistoryServiceImpl.new);
  }
}
