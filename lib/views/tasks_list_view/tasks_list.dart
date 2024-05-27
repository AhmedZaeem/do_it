import 'package:do_it/views/tasks_list_view/task_tile/tasks_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => TasksListTile(),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 32.h),
      itemCount: 10,
    );
  }
}
