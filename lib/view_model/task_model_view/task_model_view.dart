import 'package:do_it/view_model/task_model_view/task_state_notifier.dart';
import 'package:flutter/material.dart';
import '../../models/task_model.dart';
import '../../views/task_details_page/task_details_view.dart';

class TaskModelView {
  final taskNotifier = TaskStateNotifier();

  void addTask(
      BuildContext context, List<TextEditingController> controllers) async {
    if (_validator(context, controllers)) {
      var task = _createTask(controllers);
      await taskNotifier.addTask(taskNotifier.getAllTasks().length, task);
      clearControllersAndPop(context, controllers);
    }
  }

  void updateTask(BuildContext context, TaskModel task,
      List<TextEditingController> controllers) {
    if (_validator(context, controllers)) {
      _updateTaskDetails(task, controllers);
      taskNotifier.updateTask(task.id, task);
      clearControllersAndPop(context, controllers);
    }
  }

  void viewTask(BuildContext context, TaskModel task,
      List<TextEditingController> controllers) {
    _setControllerTexts(controllers, task);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TaskDetailsView(task: task)));
  }

  bool _validator(
      BuildContext context, List<TextEditingController> controllers) {
    if (controllers[0].text.isNotEmpty && controllers[2].text.isNotEmpty) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text('Please fill all fields',
            style: Theme.of(context).textTheme.displayMedium),
        duration: const Duration(seconds: 2),
      ));
      return false;
    }
  }

  TaskModel _createTask(List<TextEditingController> controllers) {
    return TaskModel(
      id: taskNotifier.getAllTasks().length,
      task: controllers[2].text,
      title: controllers[0].text,
      date: controllers[1].text.isEmpty
          ? '${DateTime.now().month} - ${DateTime.now().day} - ${DateTime.now().year} '
          : controllers[1].text,
    );
  }

  void _updateTaskDetails(
      TaskModel task, List<TextEditingController> controllers) {
    task.title = controllers[0].text;
    task.task = controllers[2].text;
    task.date = controllers[1].text;
  }

  markAsCompleted(context, TaskModel task) {
    task.isCompleted = !task.isCompleted;
    taskNotifier.updateTask(task.id, task);
    _refreshState(context);
  }

  void clearControllersAndPop(
      context, List<TextEditingController> controllers) {
    controllers.forEach((controller) => controller.clear());

    _refreshState(context);
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  void _refreshState(context) {
    context.invalidate(taskChangeNotifier);
    context.refresh(taskChangeNotifier);
  }

  void _setControllerTexts(
      List<TextEditingController> controllers, TaskModel task) {
    controllers[0].text = task.title;
    controllers[1].text = task.date;
    controllers[2].text = task.task;
  }
}
