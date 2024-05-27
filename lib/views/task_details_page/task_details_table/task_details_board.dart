import 'package:do_it/views/task_details_page/task_details_table/task_details_header.dart';
import 'package:do_it/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_text_field.dart';
import 'details_table.dart';

class TaskDetailsBoard extends StatefulWidget {
  const TaskDetailsBoard({super.key});

  @override
  State<TaskDetailsBoard> createState() => _TaskDetailsBoardState();
}

class _TaskDetailsBoardState extends State<TaskDetailsBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 23.h, horizontal: 16.w),
      padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          TaskDetailsHeader(),
          const DetailsTable(),
        ],
      ),
    );
  }
}
