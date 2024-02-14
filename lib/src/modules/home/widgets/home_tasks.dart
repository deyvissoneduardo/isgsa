import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme_extension.dart';
import '../../../models/task_filter_enum.dart';
import '../../../models/task_model.dart';
import '../home_controller.dart';
import 'task.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Selector<HomeController, String>(
            selector: (context, controller) =>
                controller.filterSelected.description,
            builder: (context, description, child) {
              return Row(
                children: [
                  Text(
                    'TASK\'S $description',
                    style: context.titleStyle,
                  ),
                  const Spacer(),
                  Checkbox.adaptive(
                    value: context.read<HomeController>().checked,
                    onChanged: (value) {
                      context
                          .read<HomeController>()
                          .checkOrUncheckAllTasks(value!);
                    },
                  ),
                ],
              );
            },
          ),
          Column(
            children: context
                .select<HomeController, List<TaskModel>>(
                  (controller) => controller.filteredTasks,
                )
                .map((task) => Task(model: task))
                .toList(),
          ),
        ],
      ),
    );
  }
}
