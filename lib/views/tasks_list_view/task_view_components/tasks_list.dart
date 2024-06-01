import 'package:do_it/models/task_model.dart';
import 'package:do_it/view_model/task_model_view/task_model_view.dart';
import 'package:do_it/views/tasks_list_view/task_tile/tasks_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/task_model_view/task_state_notifier.dart';

class TasksList extends ConsumerWidget {
  const TasksList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tasks = ref.watch(taskChangeNotifier);
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TasksListTile(
          task: tasks[index],
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
    );
  }
}
