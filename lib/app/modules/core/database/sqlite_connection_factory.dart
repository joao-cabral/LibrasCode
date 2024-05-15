import 'package:librascode/app/modules/core/database/sqlite_migration_factory.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class SqliteConnectionFactory {
  static const _version = 1;
  static const _databaseName = 'LIBRASCODE_DB';
  static SqliteConnectionFactory? _instance;

  Database? _db;
  final _lock = Lock();

  // Avoid self instance
  SqliteConnectionFactory._();

  factory SqliteConnectionFactory() {
    _instance ??= SqliteConnectionFactory._();
    return _instance!;
  }

  Future<Database> openConnection() async {
    if (_db == null) {
      await _lock.synchronized(() async {
        if (_db == null) {
          final databasePath = await getDatabasesPath();
          final pathDatabase = join(databasePath, _databaseName);

          _db = await openDatabase(pathDatabase,
              version: _version,
              onCreate: _onCreate,
              onConfigure: _onConfigure,
              onUpgrade: _onUpgrade,
              onDowngrade: _onDowngrade);
        }
      });
    }
    return _db!;
  }

  void closeConnection() {
    _db?.close();
    _db = null;
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreing_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();

    final migrations = SqliteMigrationFactory().getCreateMigration();
    for (var migration in migrations) {
      migration.create(batch);
    }

    batch.commit();
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int version) async {
    final batch = db.batch();

    final migrations = SqliteMigrationFactory().getUpdateMigration(oldVersion);
    for (var migration in migrations) {
      migration.update(batch);
    }

    batch.commit();
  }

  Future<void> _onDowngrade(Database db, int oldVersion, int version) async {}
}
