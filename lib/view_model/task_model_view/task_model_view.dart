import 'package:do_it/view_model/task_model_view/task_state_notifier.dart';
import 'package:flutter/material.dart';

import '../../models/task_model.dart';

class TaskModelView {
  final taskNotifier = TaskStateNotifier();

  addTask(context,
      {required TextEditingController taskTitle,
      required TextEditingController taskDetails,
      required TextEditingController taskDate}) async {
    if (validator(taskTitle, taskDetails, context)) {
      var id = taskNotifier.getAllTasks().length;
      TaskModel task = TaskModel(
        id: id,
        task: taskDetails.text,
        title: taskTitle.text,
        date: taskDate.text.isEmpty
            ? '${DateTime.now().month - DateTime.now().day - DateTime.now().year} '
            : taskDate.text,
      );
      await taskNotifier.addTask(id, task);
      await context.invalidate(taskChangeNotifier);
      await context.refresh(taskChangeNotifier);
      taskTitle.clear();
      taskDetails.clear();
      taskDate.clear();
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  bool validator(TextEditingController taskTitle,
      TextEditingController taskDetails, context) {
    if (taskTitle.text.isNotEmpty && taskDetails.text.isNotEmpty) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Please fill all fields',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          duration: const Duration(seconds: 2),
        ),
      );
      return false;
    }
  }
}
