import 'package:flutter/material.dart';

import '../../core/helpers/constants.dart';
import '../../core/notifier/default_listener_notifier.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/theme_extension.dart';
import '../../models/task_filter_enum.dart';
import '../task/task_module.dart';
import 'home_controller.dart';
import 'widgets/float_action_button_widget.dart';
import 'widgets/home_filters.dart';
import 'widgets/home_tasks.dart';
import 'widgets/home_week.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController;

  const HomePage({Key? key, required HomeController homeController})
      : _homeController = homeController,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    DefaultListenerNotifier(changeNotifier: widget._homeController).listener(
      context: context,
      successCallback: (notifier, listenerInstace) {
        listenerInstace.dispose();
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._homeController.loadTotalTasks();
      widget._homeController.findTasks(filter: TaskFilterEnum.today);
    });
    super.initState();
  }

  Future<void> _gotoCreateTask(BuildContext context) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInQuad,
          );
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return TaskModule().getPage('/task/create', context);
        },
      ),
    );
    widget._homeController.refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: AppColor.background,
        title: Row(
          children: [
            Image.asset(
              Constants.logopath,
              height: sizeOf.height / 15,
            ),
            SizedBox(
              width: sizeOf.width / 30,
            ),
            const Text('Todo List'),
          ],
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatActionButtonWidget(
        onPressed: () => _gotoCreateTask(context),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeFilters(),
                    HomeWeek(),
                    HomeTasks(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
