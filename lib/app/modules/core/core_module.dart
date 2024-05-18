import 'package:flutter_modular/flutter_modular.dart';
import 'package:librascode/app/repositories/historic/historic_repository_impl.dart';
import 'package:librascode/app/services/historic/historic_service_impl.dart';

import '../../repositories/historic/historic_repository.dart';
import '../../services/historic/historic_service.dart';
import 'database/sqlite_connection_factory.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(SqliteConnectionFactory.new);
    i.add<HistoricRepository>(HistoricRepositoryImpl.new);
    i.add<HistoricService>(HistoricServiceImpl.new);
  }
}
