import 'package:do_it/constants.dart';
import 'package:do_it/view_model/task_model_view/task_model_view.dart';
import 'package:do_it/views/tasks_list_view/task_tile/task_title_widget.dart';
import 'package:do_it/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/task_model.dart';
import '../../../view_model/task_model_view/task_state_notifier.dart';

class TasksListTile extends ConsumerWidget {
  const TasksListTile({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onLongPress: () => _showDeleteDialog(context, ref),
      child: Row(
        children: <Widget>[
          CustomCheckBox(
            isChecked: task.isCompleted,
            onTap: () => TaskModelView().markAsCompleted(context, task),
          ),
          SizedBox(width: 20.w),
          GestureDetector(
            onTap: () => TaskModelView()
                .viewTask(context, task, ref.read(textControllers)),
            child: TaskTitleWidget(task: task),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await TaskModelView().deleteTask(ref, task);
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
