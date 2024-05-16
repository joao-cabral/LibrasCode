import '../../models/historic_model.dart';
import '../../repositories/historic/historic_repository.dart';
import 'historic_service.dart';

class HistoricServiceImpl implements HistoricService {
  final HistoricRepository _historicRepository;

  HistoricServiceImpl({required HistoricRepository historicRepository})
      : _historicRepository = historicRepository;

  @override
  Future<HistoricModel> save(HistoricModel historicModel) async {
    final historicToSave = HistoricModel(
      videoId: historicModel.videoId,
      title: historicModel.title,
      author: historicModel.author,
    );

    var historicId = await _historicRepository.save(historicToSave);
    return historicToSave.copyWith(id: historicId);
  }

  @override
  Future<List<HistoricModel>> getAll() => _historicRepository.getAll();

  @override
  Future<void> deleteAll() => _historicRepository.deleteAll();
}
