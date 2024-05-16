import '../../models/history_model.dart';
import '../../modules/core/database/sqlite_connection_factory.dart';
import 'history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  HistoryRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<int> save(HistoryModel history) async {
    final sqlConnection = await _sqliteConnectionFactory.openConnection();
    return await sqlConnection.rawInsert(
        'insert into history values(?,?,?,?,?)',
        [null, history.videoId, history.title, history.author, null]);
  }

  @override
  Future<List<HistoryModel>> getAll() async {
    final sqlConnection = await _sqliteConnectionFactory.openConnection();
    final result = await sqlConnection.rawQuery('select * from history');

    return result
        .map<HistoryModel>((history) => HistoryModel.fromMap(history))
        .toList();
  }

  @override
  Future<void> deleteAll() async {
    final sqlConnection = await _sqliteConnectionFactory.openConnection();
    await sqlConnection.delete('history');
  }
}
