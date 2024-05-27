import 'package:do_it/views/tasks_list_view/task_tile/task_title_widget.dart';
import 'package:do_it/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksListTile extends StatelessWidget {
  const TasksListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomCheckBox(isChecked: false),
        SizedBox(width: 20.w),
        TaskTitleWidget(),
      ],
    );
  }
}
