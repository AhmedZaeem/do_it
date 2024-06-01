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
    ref.watch(taskChangeNotifier);
    return Row(
      children: <Widget>[
        CustomCheckBox(
          isChecked: task.isCompleted,
          onTap: () => TaskModelView().taskDone(task, context),
        ),
        SizedBox(width: 20.w),
        TaskTitleWidget(task: task),
      ],
    );
  }
}
