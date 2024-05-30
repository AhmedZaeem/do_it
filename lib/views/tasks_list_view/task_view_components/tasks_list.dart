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
    var tasks = ref.watch(taskChangeNotifier.notifier);
    return FutureBuilder(
      future: tasks.getAllTasks(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return TasksListTile(
                task: snapshot.data![index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 24.h),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
