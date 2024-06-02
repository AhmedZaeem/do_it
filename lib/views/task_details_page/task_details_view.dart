import 'package:do_it/constants.dart';
import 'package:do_it/view_model/task_model_view/task_model_view.dart';
import 'package:do_it/view_model/task_model_view/task_state_notifier.dart';
import 'package:do_it/views/task_details_page/task_details_actions/task_details_action_section.dart';
import 'package:do_it/views/task_details_page/task_details_table/task_details_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/task_model.dart';

class TaskDetailsView extends ConsumerStatefulWidget {
  const TaskDetailsView({super.key, this.task});
  final TaskModel? task;

  @override
  _TaskDetailsViewState createState() => _TaskDetailsViewState();
}

class _TaskDetailsViewState extends ConsumerState<TaskDetailsView> {
  @override
  Widget build(BuildContext context) {
    ref.watch(taskChangeNotifier);
    ref.watch(textControllers);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 145.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(widget.task == null ? 'Create a task' : 'Update Task',
                        style: Theme.of(context).textTheme.displayLarge),
                    const Spacer(),
                    widget.task == null
                        ? const SizedBox.shrink()
                        : IconButton(
                            icon: Icon(widget.task!.favorite
                                ? Icons.favorite
                                : Icons.favorite_border),
                            onPressed: () {
                              TaskModelView()
                                  .favoriteTask(context, widget.task!);
                              setState(() {});
                            },
                          ),
                  ],
                ),
              ),
              SizedBox(height: 28.h),
              const TaskDetailsBoard(),
              SizedBox(height: 12.h),
              TaskDetailsActionSection(task: widget.task),
            ],
          ),
        ),
      ),
    );
  }
}
