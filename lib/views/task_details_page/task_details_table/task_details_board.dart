import 'package:do_it/views/task_details_page/task_details_table/task_details_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'details_table.dart';

class TaskDetailsBoard extends StatelessWidget {
  const TaskDetailsBoard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 23.h, horizontal: 16.w),
      padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.4),
            offset: const Offset(0, 4),
            blurRadius: 8,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: const Column(
        children: [
          TaskDetailsHeader(),
          DetailsTable(),
        ],
      ),
    );
  }
}
