import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/theme_extension.dart';
import '../../../models/task_model.dart';
import '../home_controller.dart';

class Task extends StatelessWidget {
  final TaskModel model;
  final dateFormat = DateFormat('dd/MM/yyyy');

  Task({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checked = context.read<HomeController>().checked;
    return Column(
      children: [
        Card(
          shadowColor: AppColor.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.primaryColorLight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          child: IntrinsicHeight(
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(width: 1),
              ),
              leading: Checkbox(
                value: model.checked,
                onChanged: (value) =>
                    context.read<HomeController>().checkOrUncheckTask(model),
              ),
              title: Text(
                model.title,
                style: TextStyle(
                  decoration: checked ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Text(
                dateFormat.format(model.date),
                style: TextStyle(
                  decoration: checked ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: IconButton(
                onPressed: () =>
                    context.read<HomeController>().deleteTasks(model.id),
                icon: const Icon(
                  Icons.delete,
                  color: AppColor.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
