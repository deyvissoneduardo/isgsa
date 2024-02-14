import '../../models/task_model.dart';
import '../../models/week_task_model.dart';

abstract class TaskService {
  Future<void> save({
    required DateTime dateTime,
    required String title,
    required String description,
  });

  Future<List<TaskModel>> getToday();
  Future<List<TaskModel>> getTomorrow();
  Future<WeekTaskModel> getWeek();

  Future<void> deleteById(int id);
  Future<void> deleteAllTasks();

  Future<void> checkOrUncheckTask(TaskModel task);
}
