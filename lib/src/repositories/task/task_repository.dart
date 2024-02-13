import '../../models/task_model.dart';

abstract interface class TaskRepository {
  Future<void> save({
    required DateTime dateTime,
    required String title,
    required String description,
  });

  Future<List<TaskModel>> findByPeriod(DateTime start, DateTime end);
}
