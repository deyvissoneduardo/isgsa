import 'package:provider/provider.dart';

import '../../core/modules/todo_list_modules.dart';
import '../../repositories/task/task_repository.dart';
import '../../repositories/task/task_repository_impl.dart';
import '../../service/task/task_service.dart';
import '../../service/task/task_service_impl.dart';
import 'task_create_controller.dart';
import 'task_create_page.dart';

class TaskModule extends TodoListModules {
  TaskModule()
      : super(
          bindings: [
            Provider<TaskRepository>(
              create: (context) => TaskRepositoryImpl(
                sqliteConnectionFactory: context.read(),
              ),
            ),
            Provider<TaskService>(
              create: (context) => TaskServiceImpl(
                taskRepository: context.read(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => TaskCreateController(
                taskService: context.read(),
              ),
            ),
          ],
          routers: {
            '/task/create': (context) =>
                TaskCreatePage(controller: context.read()),
          },
        );
}
