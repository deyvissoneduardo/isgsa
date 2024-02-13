import '../../core/database/sqlite_connection_factory.dart';
import '../../core/helpers/constants.dart';
import '../../models/task_model.dart';
import './task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  TaskRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> save({
    required DateTime dateTime,
    required String title,
    required String description,
  }) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    await conn.insert(
      Constants.nameTable,
      {
        'id': null,
        'title': title,
        'description': description,
        'date': dateTime.toIso8601String(),
        'finalizado': 0,
      },
    );
  }

  @override
  Future<List<TaskModel>> findByPeriod(DateTime start, DateTime end) async {
    final startFilter = DateTime(start.year, start.month, start.day, 0, 0, 0);
    final endFilter = DateTime(end.year, end.month, end.day, 23, 59, 59);

    final conn = await _sqliteConnectionFactory.openConnection();
    final result = await conn.rawQuery('''
    SELECT * FROM ${Constants.nameTable}
    WHERE date between ? and ?
    ORDER BY date
    ''', [
      startFilter.toIso8601String(),
      endFilter.toIso8601String(),
    ]);
    return result.map((e) => TaskModel.loadFromDB(e)).toList();
  }
}
