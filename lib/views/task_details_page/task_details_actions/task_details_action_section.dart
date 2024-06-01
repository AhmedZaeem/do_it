import 'package:do_it/constants.dart';
import 'package:do_it/view_model/task_model_view/task_model_view.dart';
import 'package:do_it/view_model/task_model_view/task_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_button.dart';

class TaskDetailsActionSection extends ConsumerWidget {
  const TaskDetailsActionSection({super.key, this.update = false});
  final bool update;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = TaskModelView();
    var controllers = ref.read(textControllers);
    ref.read(taskChangeNotifier);
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
            btnText: update ? 'Update' : 'Save',
            width: 140,
            onTap: () => controller.addTask(context, controllers)),
      ],
    );
  }
}
