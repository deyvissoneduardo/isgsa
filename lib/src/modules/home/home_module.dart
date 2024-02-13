import 'package:provider/provider.dart';

import '../../core/modules/todo_list_modules.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends TodoListModules {
  HomeModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => HomeController(),
            ),
          ],
          routers: {
            '/home': (context) => const HomePage(),
          },
        );
}
