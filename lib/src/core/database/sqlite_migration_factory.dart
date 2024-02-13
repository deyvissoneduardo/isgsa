import 'migration/i_migration.dart';
import 'migration/migration_v1.dart';
import 'migration/migration_v2.dart';

class SqliteMigrationFactory {
  List<IMigration> getCreateMigration() => [
        MigrationV1(),
        MigrationV2(),
      ];
  List<IMigration> getUpgradeMigration(int version) => [];
}
