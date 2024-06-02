import 'package:do_it/constants.dart';
import 'package:do_it/models/task_model.dart';
import 'package:do_it/view_model/task_model_view/task_model_view.dart';
import 'package:do_it/view_model/task_model_view/task_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_button.dart';

class TaskDetailsActionSection extends ConsumerWidget {
  const TaskDetailsActionSection({super.key, this.task});
  final TaskModel? task;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = TaskModelView();
    var controllers = ref.watch(textControllers);
    ref.watch(taskChangeNotifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomButton(
            btnText: 'Back',
            width: 140,
            onTap: () =>
                controller.clearControllersAndPop(context, controllers)),
        SizedBox(width: 32.w),
        CustomButton(
            btnText: task == null ? 'Save' : 'Update',
            width: 140,
            onTap: () => task == null
                ? controller.addTask(context, controllers)
                : controller.updateTask(context, task!, controllers)),
      ],
    );
  }
}
