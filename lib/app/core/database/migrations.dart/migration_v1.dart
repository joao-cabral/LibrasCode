import 'package:librascode/app/core/database/migrations.dart/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE history(
        id Integer primary key autoincrement,
        video_id text not null,
        title TEXT,
        description text null,
        thumbnail_url TEXT,
        watch_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
''');
  }

  @override
  void update(Batch batch) {}
}
