import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_button.dart';

class TaskDetailsActionSection extends StatelessWidget {
  const TaskDetailsActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomButton(
            btnText: 'Back', width: 140, onTap: () => Navigator.pop(context)),
        SizedBox(width: 32.w),
        const CustomButton(btnText: 'Save', width: 140)
      ],
    );
  }
}
