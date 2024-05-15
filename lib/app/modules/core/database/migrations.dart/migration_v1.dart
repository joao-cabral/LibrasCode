import 'package:librascode/app/modules/core/database/migrations.dart/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE history(
        id Integer primary key autoincrement,
        videoId text not null,
        title TEXT,
        author TEXT,
        watchDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
''');
  }

  @override
  void update(Batch batch) {}
}
