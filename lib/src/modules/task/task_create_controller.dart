import 'dart:developer';

import '../../core/notifier/default_change_notifier.dart';
import '../../service/task/task_service.dart';

class TaskCreateController extends DefaultChangeNotifier {
  final TaskService _taskService;

  DateTime? _selectedDate;

  TaskCreateController({required TaskService taskService})
      : _taskService = taskService;

  set selectedDate(DateTime? selectedDate) {
    resetState();
    _selectedDate = selectedDate;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  Future<void> save({
    required String description,
    required String title,
  }) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      if (_selectedDate != null) {
        await _taskService.save(
          dateTime: _selectedDate!,
          description: description,
          title: title,
        );
        success();
      } else {
        setError('Data não selecionada');
      }
    } on Exception catch (e) {
      log('error ao salvar task', error: e);
      setError('Error ao cadastro task!!!');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
