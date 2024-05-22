import '../../models/historic_model.dart';
import '../../modules/core/database/sqlite_connection_factory.dart';
import 'historic_repository.dart';

class HistoricRepositoryImpl implements HistoricRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  HistoricRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<int> save(HistoricModel historic) async {
    final sqlConnection = await _sqliteConnectionFactory.openConnection();

    // Verificar se já existe um vídeo com o mesmo videoId
    final existingVideo = await sqlConnection.rawQuery(
        'SELECT * FROM historic WHERE videoId = ?', [historic.videoId]);

    if (existingVideo.isNotEmpty) {
      // Se já existe um vídeo com o mesmo videoId, retornar sem inserir
      return 0;
    }

    return await sqlConnection
        .rawInsert('insert into historic values(?,?,?,?,?)', [
      null,
      historic.videoId,
      historic.title,
      historic.author,
      historic.watchDate.millisecondsSinceEpoch
    ]);
  }

  @override
  Future<List<HistoricModel>> getAll() async {
    final sqlConnection = await _sqliteConnectionFactory.openConnection();
    final result = await sqlConnection
        .rawQuery('select * from historic order by watchDate desc');

    return result
        .map<HistoricModel>((historic) => HistoricModel.fromMap(historic))
        .toList();
  }

  @override
  Future<void> deleteAll() async {
    final sqlConnection = await _sqliteConnectionFactory.openConnection();
    await sqlConnection.delete('historic');
  }
}
