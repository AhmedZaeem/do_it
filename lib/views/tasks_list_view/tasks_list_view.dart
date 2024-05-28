import 'package:do_it/views/tasks_list_view/task_view_components/add_task_fab.dart';
import 'package:do_it/views/tasks_list_view/task_view_components/tasks_list.dart';
import 'package:do_it/views/tasks_list_view/task_view_components/tasks_list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: const AddTaskFab(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 145.h),
            const TasksListHeader(),
            SizedBox(height: 20.h),
            const TasksList(),
            SizedBox(height: 62.h),
          ],
        ),
      ),
    );
  }
}
