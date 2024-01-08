import 'package:librascode/app/core/database/migrations.dart/migration.dart';
import 'package:librascode/app/core/database/migrations.dart/migration_v1.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [MigrationV1()];
  List<Migration> getUpdateMigration(int version) => [];
}
