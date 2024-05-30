import 'package:do_it/view_model/task_model_view/task_state_notifier.dart';
import 'package:flutter/cupertino.dart';

import '../../models/task_model.dart';

class TaskModelView {
  addTask(BuildContext context,
      {required TextEditingController taskTitle,
      required TextEditingController taskDetails,
      required TextEditingController taskDate}) async {
    var id = (await TaskStateNotifier().getAllTasks()).length;
    TaskModel task = TaskModel(
        id: id,
        task: taskDetails.text,
        title: taskTitle.text,
        date: taskDate.text);
    await TaskStateNotifier().addTask(id, task);
    taskTitle.clear();
    taskDetails.clear();
    taskDate.clear();
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
