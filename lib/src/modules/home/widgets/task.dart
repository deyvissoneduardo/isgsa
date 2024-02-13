import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/task_model.dart';

class Task extends StatelessWidget {
  final TaskModel _model;
  final dateFormat = DateFormat('dd/MM/y');

  Task({Key? key, required TaskModel model})
      : _model = model,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.primaryColorLight, width: 2),
        boxShadow: const [
          BoxShadow(color: AppColor.info),
        ],
      ),
      child: IntrinsicHeight(
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(width: 1),
          ),
          leading: Checkbox(
            value: _model.checked,
            onChanged: (value) {},
          ),
          title: Text(
            _model.title,
            style: _model.checked
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : null,
          ),
          subtitle: Text(
            dateFormat.format(_model.date),
            style: _model.checked
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : null,
          ),
        ),
      ),
    );
  }
}
