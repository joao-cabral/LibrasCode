import '../../models/history_model.dart';

abstract class HistoryService {
  Future<HistoryModel> save(HistoryModel historyModel);
  Future<List<HistoryModel>> getAll();
  Future<void> deleteAll();
}
