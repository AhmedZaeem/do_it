import 'package:do_it/views/on_boarding/on_boarding_view.dart';
import 'package:do_it/views/tasks_list_view/tasks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyView extends StatelessWidget {
  const BodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TasksListView(),
    );
  }
}
