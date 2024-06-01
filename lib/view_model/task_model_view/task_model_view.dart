import 'package:do_it/constants.dart';
import 'package:do_it/view_model/task_model_view/task_state_notifier.dart';
import 'package:flutter/material.dart';

import '../../models/task_model.dart';

class TaskModelView {
  final taskNotifier = TaskStateNotifier();

  addTask(context) async {
    var controllers = context.read(textControllers);
    var taskTitle = controllers[0];
    var taskDetails = controllers[2];
    var taskDate = controllers[1];
    if (validator(context)) {
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

  taskDone(TaskModel task, context) {
    task.isCompleted = !task.isCompleted;
    context.invalidate(taskChangeNotifier);
    taskNotifier.updateTask(task.id, task);
    context.refresh(taskChangeNotifier);
  }

  updateTask(context) {}
  bool validator(context) {
    var controllers = context.read(textControllers);
    if (controllers[0].text.isNotEmpty && controllers[2].text.isNotEmpty) {
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
