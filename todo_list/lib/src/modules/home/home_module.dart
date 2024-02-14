import 'package:provider/provider.dart';

import '../../core/modules/todo_list_modules.dart';
import '../../repositories/task/task_repository.dart';
import '../../repositories/task/task_repository_impl.dart';
import '../../service/task/task_service.dart';
import '../../service/task/task_service_impl.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends TodoListModules {
  HomeModule()
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
              create: (context) => HomeController(
                taskService: context.read(),
              ),
            ),
          ],
          routers: {
            '/home': (context) => HomePage(
                  homeController: context.read(),
                ),
          },
        );
}
