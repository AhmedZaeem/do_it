import 'package:do_it/models/task_model.dart';
import 'package:do_it/view_model/task_model_view/task_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTitleWidget extends ConsumerWidget {
  const TaskTitleWidget({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(taskChangeNotifier);
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
        style: TextStyle(
          color: task.isCompleted ? Colors.grey : Colors.black,
          fontSize: 16.sp,
          decoration: task.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
