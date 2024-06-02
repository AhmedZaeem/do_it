import 'package:do_it/models/task_model.dart';
import 'package:do_it/view_model/favorite_model_view/favorite_state_notifier.dart';
import 'package:do_it/views/place_holders/no_tasks.dart';
import 'package:do_it/views/tasks_list_view/task_tile/tasks_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/task_model_view/task_state_notifier.dart';

class TasksList extends ConsumerStatefulWidget {
  const TasksList({super.key});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends ConsumerState<TasksList> {
  List<TaskModel> tasks = [];
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    tasks = ref.watch(taskChangeNotifier);
    favorite = ref.watch(favoriteChangeNotifier);
    if (favorite && tasks.isNotEmpty) {
      tasks = tasks.where((element) => element.favorite).toList();
    }
    return tasks.isEmpty
        ? const NoTasks()
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
