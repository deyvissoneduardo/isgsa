// ignore_for_file: avoid_renaming_method_parameters

import 'package:sqflite_common/sqlite_api.dart';

import '../../helpers/constants.dart';
import 'i_migration.dart';

class MigrationV1 extends IMigration {
  @override
  void create(Batch bath) {
    bath.execute('''
      create table ${Constants.nameTable} (
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
