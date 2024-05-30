import 'package:do_it/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_text_field.dart';

class DetailsTable extends ConsumerWidget {
  const DetailsTable({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controllers = ref.watch(textControllers);
    return Container(
      width: 259.w,
      height: 325.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      child: CustomTextField(
        controller: controllers[2],
        hint: 'write here....',
        maxLines: 24,
        verticalPadding: 8,
        horizontalPadding: 12,
      ),
    );
  }
}
