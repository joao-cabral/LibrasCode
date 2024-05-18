import '../../models/historic_model.dart';

abstract class HistoricService {
  Future<HistoricModel> save(HistoricModel historicModel);
  Future<List<HistoricModel>> getAll();
  Future<void> deleteAll();
}
