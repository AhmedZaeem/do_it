import 'package:do_it/constants.dart';
import 'package:do_it/view_model/task_model_view/task_model_view.dart';
import 'package:do_it/view_model/task_model_view/task_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_button.dart';

class TaskDetailsActionSection extends ConsumerWidget {
  const TaskDetailsActionSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(textControllers);
    ref.read(taskChangeNotifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomButton(
            btnText: 'Back', width: 140, onTap: () => Navigator.pop(context)),
        SizedBox(width: 32.w),
        CustomButton(
            btnText: 'Save',
            width: 140,
            onTap: () async => await TaskModelView().addTask(context)),
      ],
    );
  }
}
