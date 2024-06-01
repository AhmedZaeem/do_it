import 'package:do_it/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTitleWidget extends StatelessWidget {
  const TaskTitleWidget({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 270.w,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 6.r,
            blurStyle: BlurStyle.outer,
            color: Colors.black.withOpacity(.7),
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Text(
        task.title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
