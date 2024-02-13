import 'migration/i_migration.dart';
import 'migration/migration_v1.dart';

class SqliteMigrationFactory {
  List<IMigration> getCreateMigration() => [
        MigrationV1(),
      ];
  List<IMigration> getUpgradeMigration(int version) => [];
}
