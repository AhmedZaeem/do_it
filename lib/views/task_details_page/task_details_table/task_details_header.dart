import 'package:do_it/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_text_field.dart';

class TaskDetailsHeader extends ConsumerWidget {
  const TaskDetailsHeader({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controllers = ref.watch(textControllers);
    return Row(
      children: <Widget>[
        SizedBox(
          width: 180.w,
          child: CustomTextField(hint: 'Title', controller: controllers[0]),
        ),
        SizedBox(
          width: 120.w,
          child: CustomTextField(hint: 'Date', controller: controllers[1]),
        ),
      ],
    );
  }
}
