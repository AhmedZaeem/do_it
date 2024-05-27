import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_text_field.dart';

class DetailsTable extends StatelessWidget {
  const DetailsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 259.w,
      height: 325.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      child: const CustomTextField(
        hint: 'write here....',
        maxLines: 24,
        verticalPadding: 8,
        horizontalPadding: 12,
      ),
    );
  }
}
