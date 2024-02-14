import '../../models/task_model.dart';
import '../../models/week_task_model.dart';
import '../../repositories/task/task_repository.dart';
import 'task_service.dart';

class TaskServiceImpl implements TaskService {
  final TaskRepository _taskRepository;

  TaskServiceImpl({
    required TaskRepository taskRepository,
  }) : _taskRepository = taskRepository;

  @override
  Future<void> save({
    required DateTime dateTime,
    required String title,
    required String description,
  }) =>
      _taskRepository.save(
        dateTime: dateTime,
        title: title,
        description: description,
      );

  @override
  Future<List<TaskModel>> getToday() =>
      _taskRepository.findByPeriod(DateTime.now(), DateTime.now());

  @override
  Future<List<TaskModel>> getTomorrow() {
    final tomorrowDate = DateTime.now().add(const Duration(days: 1));
    return _taskRepository.findByPeriod(tomorrowDate, tomorrowDate);
  }

  @override
  Future<WeekTaskModel> getWeek() async {
    final today = DateTime.now();

    var startFilter = DateTime(today.year, today.month, today.day, 0, 0, 0);

    DateTime endFilter;

    if (startFilter.weekday != DateTime.monday) {
      startFilter =
          startFilter.subtract(Duration(days: (startFilter.weekday - 1)));
    }

    endFilter = startFilter.add(const Duration(days: 7));

    final tasks = await _taskRepository.findByPeriod(startFilter, endFilter);

    return WeekTaskModel(
      startDate: startFilter,
      endDate: endFilter,
      tasks: tasks,
    );
  }

  @override
  Future<void> checkOrUncheckTask(TaskModel task) =>
      _taskRepository.checkOrUncheckTask(task);

  @override
  Future<void> deleteAllTasks() => _taskRepository.deleteAllTasks();

  @override
  Future<void> deleteById(int id) => _taskRepository.deleteById(id);
}
