import 'package:sqflite_common/sqlite_api.dart';

import 'i_migration.dart';

class MigrationV1 extends IMigration {
  @override
  void create(Batch bath) {
    bath.execute('''
      create table todo(
        id Integer primary key autoincrement,
        title varchar(500) not null,
        description varchar(500) not null,
        date datatime,
        checked integer
      )
    ''');
  }

  @override
  void upgrade(Batch bath) {}
}
