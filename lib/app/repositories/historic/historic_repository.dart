import '../../models/historic_model.dart';

abstract class HistoricRepository {
  Future<int> save(HistoricModel historicModel);
  Future<List<HistoricModel>> getAll();
  Future<void> deleteAll();
}
