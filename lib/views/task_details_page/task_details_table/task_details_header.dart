import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_text_field.dart';

class TaskDetailsHeader extends StatelessWidget {
  const TaskDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 180.w,
          child: const CustomTextField(hint: 'Title'),
        ),
        SizedBox(width: 120.w, child: const CustomTextField(hint: 'Date')),
      ],
    );
  }
}
