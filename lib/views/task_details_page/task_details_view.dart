import 'package:do_it/views/task_details_page/task_details_actions/task_details_action_section.dart';
import 'package:do_it/views/task_details_page/task_details_table/task_details_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/task_model.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key, this.task});
  final TaskModel? task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 145.h),
              Text('Create a task',
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(height: 28.h),
              const TaskDetailsBoard(),
              SizedBox(height: 12.h),
              TaskDetailsActionSection(update: task != null),
            ],
          ),
        ),
      ),
    );
  }
}
