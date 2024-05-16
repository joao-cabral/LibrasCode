import '../../models/history_model.dart';

abstract class HistoryRepository {
  Future<int> save(HistoryModel historyModel);
  Future<List<HistoryModel>> getAll();
  Future<void> deleteAll();
}
