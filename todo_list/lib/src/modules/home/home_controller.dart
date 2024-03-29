import 'dart:developer';

import '../../core/notifier/default_change_notifier.dart';
import '../../models/task_filter_enum.dart';
import '../../models/task_model.dart';
import '../../models/total_tasks_model.dart';
import '../../models/week_task_model.dart';
import '../../service/task/task_service.dart';

class HomeController extends DefaultChangeNotifier {
  final TaskService _taskService;

  var filterSelected = TaskFilterEnum.today;

  TotalTasksModel? todayTotalTasks;
  TotalTasksModel? tomorrowTotalTasks;
  TotalTasksModel? weekTotalTasks;
  List<TaskModel> allTasks = [];
  List<TaskModel> filteredTasks = [];
  DateTime? initialDateOfWeek;
  DateTime? selectedDay;
  bool showFinishingTasks = false;
  bool checked = false;

  HomeController({
    required TaskService taskService,
  }) : _taskService = taskService;

  void loadTotalTasks() async {
    final allTasks = await Future.wait([
      _taskService.getToday(),
      _taskService.getTomorrow(),
      _taskService.getWeek(),
    ]);

    final todayTasks = allTasks[0] as List<TaskModel>;
    final tomorrowTasks = allTasks[1] as List<TaskModel>;
    final weekTasks = allTasks[2] as WeekTaskModel;

    todayTotalTasks = TotalTasksModel(
      totalTask: todayTasks.length,
      totalTaskFinish: todayTasks.where((task) => task.checked).length,
    );

    tomorrowTotalTasks = TotalTasksModel(
      totalTask: tomorrowTasks.length,
      totalTaskFinish: tomorrowTasks.where((task) => task.checked).length,
    );

    weekTotalTasks = TotalTasksModel(
      totalTask: weekTasks.tasks.length,
      totalTaskFinish: weekTasks.tasks.where((task) => task.checked).length,
    );

    notifyListeners();
  }

  Future<void> findTasks({required TaskFilterEnum filter}) async {
    filterSelected = filter;
    showLoading();
    notifyListeners();
    List<TaskModel> tasks;

    switch (filter) {
      case TaskFilterEnum.today:
        tasks = await _taskService.getToday();
        break;
      case TaskFilterEnum.tomorrow:
        tasks = await _taskService.getTomorrow();
        break;
      case TaskFilterEnum.week:
        final weekModel = await _taskService.getWeek();
        initialDateOfWeek = weekModel.startDate;
        tasks = weekModel.tasks;
        break;
    }
    filteredTasks = tasks;
    allTasks = tasks;

    if (filter == TaskFilterEnum.week) {
      if (selectedDay != null) {
        filterByDay(selectedDay!);
      } else if (initialDateOfWeek != null) {
        filterByDay(initialDateOfWeek!);
      }
    } else {
      selectedDay = null;
    }

    if (!showFinishingTasks) {
      filteredTasks = filteredTasks.where((task) => !task.checked).toList();
    }

    hideLoading();
    notifyListeners();
  }

  void filterByDay(DateTime date) {
    selectedDay = date;
    filteredTasks = allTasks.where((task) {
      return task.date == date;
    }).toList();
    notifyListeners();
  }

  void refreshPage() async {
    await findTasks(filter: filterSelected);
    loadTotalTasks();
    notifyListeners();
  }

  Future<void> checkOrUncheckTask(TaskModel task) async {
    showLoadingAndResetState();
    notifyListeners();

    final taskUpdate = task.copyWith(
      checked: !task.checked,
    );
    await _taskService.checkOrUncheckTask(taskUpdate);
    hideLoading();
    refreshPage();
  }

  void showOrHideFinishTask() {
    showFinishingTasks = !showFinishingTasks;
    refreshPage();
    notifyListeners();
  }

  Future<void> deleteTasks(int id) async {
    await _taskService.deleteById(id);
    refreshPage();
    notifyListeners();
  }

  Future<void> showOnlyFinishTask() async {
    filteredTasks = allTasks.where((task) {
      return task.checked;
    }).toList();
    notifyListeners();
  }

  void checkOrUncheckAllTasks(bool value) {
    showLoadingAndResetState();
    notifyListeners();

    for (TaskModel task in allTasks) {
      task.checked = value;
    }
    checked = !checked;
    log('$checked');

    notifyListeners();
    hideLoading();
    refreshPage();
  }
}
