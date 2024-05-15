import '../../models/history_model.dart';
import '../../repositories/history/history_repository.dart';
import 'history_service.dart';

class HistoryServiceImpl implements HistoryService {
  final HistoryRepository _historyRepository;

  HistoryServiceImpl({required HistoryRepository historyRepository})
      : _historyRepository = historyRepository;

  @override
  Future<HistoryModel> save(HistoryModel historyModel) async {
    final historyToSave = HistoryModel(
      videoId: historyModel.videoId,
      title: historyModel.title,
      author: historyModel.author,
    );

    var historyId = await _historyRepository.save(historyToSave);
    return historyToSave.copyWith(id: historyId);
  }

  @override
  Future<List<HistoryModel>> getAll() => _historyRepository.getAll();

  @override
  Future<void> deleteAll() => _historyRepository.deleteAll();
}
